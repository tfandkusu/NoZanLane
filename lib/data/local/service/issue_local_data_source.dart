import 'package:drift/drift.dart';
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

  /// Issue を ID の昇順で全件返す。
  Future<List<IssueData>> list() async {
    final records = await (_database.select(
      _database.issue,
    )..orderBy([(table) => OrderingTerm.asc(table.id)])).get();

    return records.toList(growable: false);
  }
}

/// IssueLocalDataSource の生成を担当する Provider。
@riverpod
Future<IssueLocalDataSource> issueLocalDataSource(Ref ref) async {
  final database = await ref.watch(noZanLaneDatabaseProvider.future);

  return IssueLocalDataSource(database: database);
}
