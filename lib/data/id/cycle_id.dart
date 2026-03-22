import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_id.freezed.dart';

/// Cycle テーブルへの参照を表す値クラス。
@freezed
abstract class CycleId with _$CycleId {
  /// [CycleId] を生成する。
  const factory CycleId({required int id}) = _CycleId;
}
