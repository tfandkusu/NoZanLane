import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_frame.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_provider.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_ui_model.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: MemberProfileFrame)
/// [MemberProfileFrame] のデフォルトユースケースです。
Widget memberProfileFrameUseCase(BuildContext context) {
  return const MemberProfileFrame();
}

@widgetbook.UseCase(name: 'Loading', type: MemberProfileFrame)
/// [MemberProfileFrame] のローディング状態ユースケースです。
Widget memberProfileFrameLoadingUseCase(BuildContext context) {
  return ProviderScope(
    overrides: [
      memberProfileProvider.overrideWith(_LoadingMemberProfile.new),
    ],
    child: const MemberProfileFrame(),
  );
}

@widgetbook.UseCase(name: 'Error', type: MemberProfileFrame)
/// [MemberProfileFrame] のエラー状態ユースケースです。
Widget memberProfileFrameErrorUseCase(BuildContext context) {
  return ProviderScope(
    overrides: [
      memberProfileProvider.overrideWith(_ErrorMemberProfile.new),
    ],
    child: const MemberProfileFrame(),
  );
}

class _LoadingMemberProfile extends MemberProfile {
  @override
  Future<MemberProfileUiModel> build() {
    return Completer<MemberProfileUiModel>().future;
  }
}

class _ErrorMemberProfile extends MemberProfile {
  @override
  Future<MemberProfileUiModel> build() async {
    throw Exception('Network error');
  }
}
