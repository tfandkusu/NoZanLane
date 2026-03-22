import 'package:drift/drift.dart';

/// ステータスを保存するテーブル定義。
class Status extends Table {
  /// テーブル名。
  @override
  String get tableName => 'statuses';

  /// ステータスID。
  IntColumn get id => integer()();

  /// 表示ラベル。
  TextColumn get label => text()();

  /// 表示色（0xRRGGBB）。
  IntColumn get color => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
