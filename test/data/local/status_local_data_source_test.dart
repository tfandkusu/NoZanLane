import 'dart:io';

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

    test('seed.yaml から書き込み、ID昇順で取得できる', () async {
      final yamlText = File('assets/seed.yaml').readAsStringSync();

      await dataSource.writeFromSeedYaml(yamlText);
      final statuses = await dataSource.list();

      expect(statuses, hasLength(4));
      expect(statuses.map((e) => e.id), [1, 2, 3, 4]);
      expect(statuses.map((e) => e.label), [
        'TODO',
        'Progress',
        'Review',
        'Done',
      ]);
      expect(statuses.map((e) => e.color), [
        '607D8B',
        '2196F3',
        'FF9800',
        '4CAF50',
      ]);
    });

    test('入力順に依存せず ID 昇順で取得できる', () async {
      const yamlText = '''
statuses:
  - id: 3
    label: C
    color: "333333"
  - id: 1
    label: A
    color: "111111"
  - id: 2
    label: B
    color: "222222"
''';

      await dataSource.writeFromSeedYaml(yamlText);
      final statuses = await dataSource.list();

      expect(statuses.map((e) => e.id), [1, 2, 3]);
      expect(statuses.map((e) => e.label), ['A', 'B', 'C']);
    });
  });
}
