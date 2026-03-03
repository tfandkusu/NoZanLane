import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:no_zan_lane/data/local/cycle_local_data_store.dart';
import 'package:no_zan_lane/data/local/cycle_local_data_store_seed.dart';

void main() {
  group('CycleLocalDataStore', () {
    late CycleLocalDataStore dataStore;

    setUp(() async {
      dataStore = await CycleLocalDataStore.create(
        executor: NativeDatabase.memory(),
        now: () => DateTime(2026, 3, 4, 10, 30),
      );
      final seed = CycleLocalDataStoreSeed(
        now: () => DateTime(2026, 3, 4, 10, 30),
      );
      await seed.seedInitialCycles(dataStore);
    });

    tearDown(() async {
      await dataStore.close();
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
