import 'package:drift/drift.dart';

import 'package:no_zan_lane/data/local/entity/cycle.dart';
import 'package:no_zan_lane/data/local/entity/status.dart';

/// 仕事のタスクの最小単位を表すテーブル定義。
class Issue extends Table {
  /// テーブル名。
  @override
  String get tableName => 'issues';

  /// プライマリーID。
  IntColumn get id => integer().autoIncrement()();

  /// タイトル。
  TextColumn get title => text()();

  /// 本文。
  TextColumn get body => text()();

  /// 相対ポイント。
  IntColumn get point => integer()();

  /// サイクルID（cycles テーブルへの参照）。
  IntColumn get cycleId => integer().references(Cycle, #id)();

  /// ステータスID（statuses テーブルへの参照）。
  IntColumn get statusId => integer().references(Status, #id)();
}
