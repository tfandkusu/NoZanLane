/// Issue シードデータを表すモデルです。
class SeedIssue {
  /// [SeedIssue] を生成します。
  const SeedIssue({
    required this.title,
    required this.body,
    required this.relativePoint,
    required this.cycleStartAt,
    required this.cycleEndAt,
    required this.status,
  });

  /// Issue のタイトルです。
  final String title;

  /// Issue の本文です。
  final String body;

  /// 相対ポイントです。
  final int relativePoint;

  /// サイクル開始日時です。
  final DateTime cycleStartAt;

  /// サイクル終了日時です。
  final DateTime cycleEndAt;

  /// ステータスです。
  final String status;
}
