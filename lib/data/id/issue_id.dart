import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue_id.freezed.dart';

/// Issue テーブルへの参照を表す値クラス。
@freezed
abstract class IssueId with _$IssueId {
  /// [IssueId] を生成する。
  const factory IssueId({required int id}) = _IssueId;
}
