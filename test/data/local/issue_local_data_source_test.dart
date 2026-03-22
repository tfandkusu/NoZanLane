import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:no_zan_lane/data/local/service/issue_local_data_source.dart';

void main() {
  group('IssueLocalDataSource', () {
    late ProviderContainer container;
    late IssueLocalDataSource dataSource;

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

      dataSource = await container.read(issueLocalDataSourceProvider.future);
    });

    tearDown(() {
      container.dispose();
    });

    test('cycleId, statusId で絞り込み sortOrder 昇順で取得できる', () async {
      await dataSource.replaceAll([
        IssueCompanion.insert(
          id: const Value(2),
          title: 'Second',
          body: 'Body 2',
          point: 2,
          cycleId: 1,
          statusId: 1,
          sortOrder: 2,
        ),
        IssueCompanion.insert(
          id: const Value(1),
          title: 'First',
          body: 'Body 1',
          point: 1,
          cycleId: 1,
          statusId: 1,
          sortOrder: 1,
        ),
      ]);
      final issues = await dataSource.list(cycleId: 1, statusId: 1);

      expect(issues.map((e) => e.id), [1, 2]);
      expect(issues.map((e) => e.title), ['First', 'Second']);
      expect(issues.map((e) => e.sortOrder), [1, 2]);
    });
  });
}
