import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_profile_ui_model.freezed.dart';

/// MemberProfile 画面の状態モデルです。
@freezed
abstract class MemberProfileUiModel with _$MemberProfileUiModel {
  /// [MemberProfileUiModel] を生成します。
  const factory MemberProfileUiModel({
    required String introductionText,
  }) = _MemberProfileUiModel;
}
