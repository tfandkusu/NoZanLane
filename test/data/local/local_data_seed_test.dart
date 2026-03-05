import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:no_zan_lane/data/local/seed/local_data_seed.dart';
import 'package:no_zan_lane/data/local/service/local_current_time.dart';
import 'package:no_zan_lane/data/local/service/status_local_data_source.dart';

void main() {
  group('LocalDataSeed', () {
    late ProviderContainer container;
    late LocalDataSeed seed;
    late StatusLocalDataSource statusLocalDataSource;

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
          localCurrentTimeProvider.overrideWithValue(
            _FixedLocalCurrentTime(DateTime(2026, 3, 4, 10, 30)),
          ),
        ],
      );

      seed = container.read(localDataSeedProvider);
      statusLocalDataSource = await container.read(
        statusLocalDataSourceProvider.future,
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('seed.yaml の statuses を初期投入できる', () async {
      final yamlText = File('assets/seed.yaml').readAsStringSync();

      await seed.seedStatuses(statusLocalDataSource, yamlText: yamlText);
      final statuses = await statusLocalDataSource.list();

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

    test('既にデータがある場合は再投入しない', () async {
      const firstYaml = '''
statuses:
  - id: 1
    label: FIRST
    color: "111111"
''';
      const secondYaml = '''
statuses:
  - id: 1
    label: SECOND
    color: "222222"
''';

      await seed.seedStatuses(statusLocalDataSource, yamlText: firstYaml);
      await seed.seedStatuses(statusLocalDataSource, yamlText: secondYaml);

      final statuses = await statusLocalDataSource.list();
      expect(statuses, hasLength(1));
      expect(statuses.single.label, 'FIRST');
      expect(statuses.single.color, '111111');
    });
  });
}

class _FixedLocalCurrentTime extends LocalCurrentTime {
  _FixedLocalCurrentTime(this._value);

  final DateTime _value;

  @override
  DateTime now() => _value;
}
