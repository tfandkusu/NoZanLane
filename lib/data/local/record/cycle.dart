import 'package:drift/drift.dart';

/// サイクルを保存するテーブル定義。
class Cycle extends Table {
  /// テーブル名。
  @override
  String get tableName => 'cycles';

  /// プライマリーID。
  IntColumn get id => integer().autoIncrement()();

  /// 作成日時（UNIX ミリ秒）。
  IntColumn get createdAt => integer()();

  /// 更新日時（UNIX ミリ秒）。
  IntColumn get updatedAt => integer()();

  /// サイクル開始日時（UNIX ミリ秒）。
  IntColumn get startAt => integer()();

  /// サイクル終了日時（UNIX ミリ秒）。
  IntColumn get endAt => integer()();
}
