import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:no_zan_lane/data/local/service/status_local_data_source.dart';

void main() {
  group('StatusLocalDataSource', () {
    late ProviderContainer container;
    late StatusLocalDataSource dataSource;

    setUp(() async {
      container = ProviderContainer(
        overrides: [
          noZanLaneDatabaseProvider.overrideWith((ref) async {
            final database = NoZanLaneDatabase(
              executor: NativeDatabase.memory(),
            );
            ref.onDispose(database.close);
            return database;
          }),
        ],
      );

      dataSource = await container.read(statusLocalDataSourceProvider.future);
    });

    tearDown(() {
      container.dispose();
    });

    test('入力順に依存せず ID 昇順で取得できる', () async {
      await dataSource.replaceAll([
        StatusCompanion.insert(
          id: const Value(3),
          label: 'C',
          color: 0x333333,
        ),
        StatusCompanion.insert(
          id: const Value(1),
          label: 'A',
          color: 0x111111,
        ),
        StatusCompanion.insert(
          id: const Value(2),
          label: 'B',
          color: 0x222222,
        ),
      ]);
      final statuses = await dataSource.list();

      expect(statuses.map((e) => e.id), [1, 2, 3]);
      expect(statuses.map((e) => e.label), ['A', 'B', 'C']);
    });
  });
}
