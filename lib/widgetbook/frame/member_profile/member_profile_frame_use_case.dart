import 'package:flutter/material.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_frame.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: MemberProfileFrame)
/// [MemberProfileFrame] のデフォルトユースケースです。
Widget memberProfileFrameUseCase(BuildContext context) {
  return const MaterialApp(home: MemberProfileFrame());
}
