import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:no_zan_lane/local_data_store/cycle_local_data_store.dart';

void main() {
  group('CycleLocalDataStore', () {
    late CycleLocalDataStore dataStore;

    setUp(() async {
      dataStore = await CycleLocalDataStore.create(
        executor: NativeDatabase.memory(),
        now: () => DateTime(2026, 3, 4, 10, 30),
      );
    });

    tearDown(() async {
      await dataStore.close();
    });

    test('初期データ3件が取得できる', () async {
      final cycles = await dataStore.list();

      expect(cycles, hasLength(3));
      expect(cycles[0].startAt, DateTime(2026, 2, 23));
      expect(cycles[0].endAt, DateTime(2026, 3, 2));
      expect(cycles[1].startAt, DateTime(2026, 3, 2));
      expect(cycles[1].endAt, DateTime(2026, 3, 9));
      expect(cycles[2].startAt, DateTime(2026, 3, 9));
      expect(cycles[2].endAt, DateTime(2026, 3, 16));
    });

    test('4個目を追加して一覧取得できる', () async {
      final insertedId = await dataStore.add(
        startAt: DateTime(2026, 3, 16),
        endAt: DateTime(2026, 3, 23),
      );
      final cycles = await dataStore.list();

      expect(insertedId, 4);
      expect(cycles, hasLength(4));
      expect(cycles.last.startAt, DateTime(2026, 3, 16));
      expect(cycles.last.endAt, DateTime(2026, 3, 23));
    });
  });
}
