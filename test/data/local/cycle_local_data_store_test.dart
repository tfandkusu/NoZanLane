import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:no_zan_lane/data/local/seed/local_data_seed.dart';
import 'package:no_zan_lane/data/local/service/cycle_local_data_source.dart';
import 'package:no_zan_lane/data/local/service/local_current_time.dart';
import 'package:no_zan_lane/data/local/service/status_local_data_source.dart';

void main() {
  group('CycleLocalDataSource', () {
    late ProviderContainer container;
    late CycleLocalDataSource dataSource;
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

      dataSource = await container.read(cycleLocalDataSourceProvider.future);
      statusLocalDataSource = await container.read(
        statusLocalDataSourceProvider.future,
      );

      final seed = container.read(localDataSeedProvider);
      final yamlText = File('assets/seed.yaml').readAsStringSync();
      await seed.seedInitialData(
        cycleLocalDataSource: dataSource,
        statusLocalDataSource: statusLocalDataSource,
        yamlText: yamlText,
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('初期データ3件が取得できる', () async {
      final cycles = await dataSource.list();

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
      final insertedId = await dataSource.add(
        startAt: DateTime(2026, 3, 16),
        endAt: DateTime(2026, 3, 23),
      );
      final cycles = await dataSource.list();

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

class _FixedLocalCurrentTime extends LocalCurrentTime {
  _FixedLocalCurrentTime(this._value);

  final DateTime _value;

  @override
  DateTime now() => _value;
}
