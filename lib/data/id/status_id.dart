import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_id.freezed.dart';

/// Status テーブルへの参照を表す値クラス。
@freezed
abstract class StatusId with _$StatusId {
  /// [StatusId] を生成する。
  const factory StatusId({required int id}) = _StatusId;
}
