import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/id/cycle_id.dart';
import 'package:no_zan_lane/data/id/status_id.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'issue_local_data_source.g.dart';

/// 仕事のタスク（Issue）を SQLite に保存するローカルデータソース。
class IssueLocalDataSource {
  /// コンストラクタ。
  IssueLocalDataSource({required NoZanLaneDatabase database})
    : _database = database;

  final NoZanLaneDatabase _database;

  /// Issue を全件置き換える。
  /// 指定された Issue データ [`companions`] でテーブルの内容をすべて置き換えます。
  Future<void> replaceAll(List<IssueCompanion> companions) async {
    await _database.transaction(() async {
      await _database.issue.deleteAll();
      await _database.issue.insertAll(companions.toList());
    });
  }

  /// 指定したサイクル・ステータスに属する Issue を sortOrder 昇順で返す。
  Future<List<IssueData>> list({
    required CycleId cycleId,
    required StatusId statusId,
  }) async {
    final query = _database.select(_database.issue)
      ..where(
        (t) => t.cycleId.equals(cycleId.id) & t.statusId.equals(statusId.id),
      )
      ..orderBy([
        (t) => OrderingTerm.asc(t.sortOrder),
        (t) => OrderingTerm.asc(t.id),
      ]);

    final records = await query.get();
    return records.toList(growable: false);
  }

  /// 全 Issue を cycleId, statusId, sortOrder, id の昇順で返す。
  /// テスト・検証用。
  Future<List<IssueData>> listAll() async {
    final records =
        await (_database.select(_database.issue)..orderBy([
              (t) => OrderingTerm.asc(t.cycleId),
              (t) => OrderingTerm.asc(t.statusId),
              (t) => OrderingTerm.asc(t.sortOrder),
              (t) => OrderingTerm.asc(t.id),
            ]))
            .get();

    return records.toList(growable: false);
  }

  /// Issue が 1 件以上存在するか。
  ///
  /// [list] が cycleId, statusId で絞り込むため、
  /// LocalDataSeed のシードスキップ判定で「テーブルが空か」を確認するために用いる。
  Future<bool> hasAny() async {
    final rows = await (_database.select(_database.issue)..limit(1)).get();
    return rows.isNotEmpty;
  }
}

/// IssueLocalDataSource の生成を担当する Provider。
@riverpod
Future<IssueLocalDataSource> issueLocalDataSource(Ref ref) async {
  final database = await ref.watch(noZanLaneDatabaseProvider.future);

  return IssueLocalDataSource(database: database);
}
