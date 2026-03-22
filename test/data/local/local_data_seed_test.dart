import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:no_zan_lane/data/local/seed/local_data_seed.dart';
import 'package:no_zan_lane/data/local/service/cycle_local_data_source.dart';
import 'package:no_zan_lane/data/local/service/issue_local_data_source.dart';
import 'package:no_zan_lane/data/local/service/local_current_time.dart';
import 'package:no_zan_lane/data/local/service/status_local_data_source.dart';

void main() {
  group('LocalDataSeed', () {
    late ProviderContainer container;
    late LocalDataSeed seed;
    late CycleLocalDataSource cycleLocalDataSource;
    late StatusLocalDataSource statusLocalDataSource;
    late IssueLocalDataSource issueLocalDataSource;

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
      cycleLocalDataSource = await container.read(
        cycleLocalDataSourceProvider.future,
      );
      statusLocalDataSource = await container.read(
        statusLocalDataSourceProvider.future,
      );
      issueLocalDataSource = await container.read(
        issueLocalDataSourceProvider.future,
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('サイクルとステータスを初期投入できる', () async {
      final yamlText = File('assets/seed.yaml').readAsStringSync();

      await seed.seedInitialData(
        cycleLocalDataSource: cycleLocalDataSource,
        statusLocalDataSource: statusLocalDataSource,
        issueLocalDataSource: issueLocalDataSource,
        yamlText: yamlText,
      );

      final cycles = await cycleLocalDataSource.list();
      expect(cycles, hasLength(3));

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
        0x607D8B,
        0x2196F3,
        0xFF9800,
        0x4CAF50,
      ]);

      final issues = await issueLocalDataSource.listAll();
      expect(issues, hasLength(7));
      expect(issues.first.title, 'CI が intermittent に失敗する');
      expect(issues.first.sortOrder, 1);
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

      await seed.seedInitialData(
        cycleLocalDataSource: cycleLocalDataSource,
        statusLocalDataSource: statusLocalDataSource,
        issueLocalDataSource: issueLocalDataSource,
        yamlText: firstYaml,
      );
      await seed.seedInitialData(
        cycleLocalDataSource: cycleLocalDataSource,
        statusLocalDataSource: statusLocalDataSource,
        issueLocalDataSource: issueLocalDataSource,
        yamlText: secondYaml,
      );

      final cycles = await cycleLocalDataSource.list();
      expect(cycles, hasLength(3));

      final statuses = await statusLocalDataSource.list();
      expect(statuses, hasLength(1));
      expect(statuses.single.label, 'FIRST');
      expect(statuses.single.color, 0x111111);
    });
  });
}

class _FixedLocalCurrentTime extends LocalCurrentTime {
  _FixedLocalCurrentTime(this._value);

  final DateTime _value;

  @override
  DateTime now() => _value;
}
