import 'package:drift/drift.dart';
import 'package:no_zan_lane/data/local/database/no_zan_lane_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'status_local_data_source.g.dart';

/// ステータスを SQLite に保存するローカルデータソース。
class StatusLocalDataSource {
  /// コンストラクタ。
  StatusLocalDataSource({required NoZanLaneDatabase database})
    : _database = database;

  final NoZanLaneDatabase _database;

  /// ステータスを全件置き換える。
  /// 指定されたステータスデータ [`companions`] でテーブルの内容をすべて置き換えます。
  Future<void> replaceAll(List<StatusCompanion> companions) async {
    await _database.transaction(() async {
      // ステータステーブルの全レコードを削除
      await _database.status.deleteAll();
      // companions の内容を一括で挿入
      await _database.status.insertAll(companions.toList());
    });
  }

  /// ステータスを ID の昇順で全件返す。
  Future<List<StatusData>> list() async {
    final records = await (_database.select(
      _database.status,
    )..orderBy([(table) => OrderingTerm.asc(table.id)])).get();

    return records.toList(growable: false);
  }
}

/// StatusLocalDataSource の生成を担当する Provider。
@riverpod
Future<StatusLocalDataSource> statusLocalDataSource(Ref ref) async {
  final database = await ref.watch(noZanLaneDatabaseProvider.future);

  return StatusLocalDataSource(database: database);
}
