/// サイクル1件を表す値オブジェクト。
class Cycle {
  /// コンストラクタ。
  const Cycle({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.startAt,
    required this.endAt,
  });

  /// プライマリーID。
  final int id;

  /// 作成日時。
  final DateTime createdAt;

  /// 更新日時。
  final DateTime updatedAt;

  /// サイクル開始日時。
  final DateTime startAt;

  /// サイクル終了日時。
  final DateTime endAt;
}
