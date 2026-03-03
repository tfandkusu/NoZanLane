import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/data/local/cycle_local_data_store.dart';
import 'package:no_zan_lane/data/local/cycle_local_data_store_provider.dart';
import 'package:no_zan_lane/data/local/local_data_store_seed.dart';
import 'package:no_zan_lane/data/local/local_database_provider.dart';

void main() {
  group('CycleLocalDataStore', () {
    late ProviderContainer container;
    late CycleLocalDataStore dataStore;

    setUp(() async {
      container = ProviderContainer(
        overrides: [
          localDatabaseExecutorProvider.overrideWithValue(
            NativeDatabase.memory(),
          ),
          cycleNowProvider.overrideWithValue(
            () => DateTime(2026, 3, 4, 10, 30),
          ),
        ],
      );

      dataStore = await container.read(cycleLocalDataStoreProvider.future);

      final seed = LocalDataStoreSeed(
        now: () => DateTime(2026, 3, 4, 10, 30),
      );
      await seed.seedInitialData(dataStore);
    });

    tearDown(() {
      container.dispose();
    });

    test('初期データ3件が取得できる', () async {
      final cycles = await dataStore.list();

      expect(cycles, hasLength(3));
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles[0].startAt),
        DateTime(2026, 2, 23),
      );
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles[0].endAt),
        DateTime(2026, 3, 2),
      );
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles[1].startAt),
        DateTime(2026, 3, 2),
      );
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles[1].endAt),
        DateTime(2026, 3, 9),
      );
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles[2].startAt),
        DateTime(2026, 3, 9),
      );
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles[2].endAt),
        DateTime(2026, 3, 16),
      );
    });

    test('4個目を追加して一覧取得できる', () async {
      final insertedId = await dataStore.add(
        startAt: DateTime(2026, 3, 16),
        endAt: DateTime(2026, 3, 23),
      );
      final cycles = await dataStore.list();

      expect(insertedId, 4);
      expect(cycles, hasLength(4));
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles.last.startAt),
        DateTime(2026, 3, 16),
      );
      expect(
        DateTime.fromMillisecondsSinceEpoch(cycles.last.endAt),
        DateTime(2026, 3, 23),
      );
    });
  });
}
