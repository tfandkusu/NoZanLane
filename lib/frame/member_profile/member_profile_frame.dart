import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/component/ds_body_text.dart';
import 'package:no_zan_lane/component/ds_divider.dart';
import 'package:no_zan_lane/component/ds_profile_main_photo.dart';
import 'package:no_zan_lane/component/ds_subtitle.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_provider.dart';

/// MemberProfile 画面の Frame 実装です。
class MemberProfileFrame extends HookConsumerWidget {
  /// [MemberProfileFrame] を生成します。
  const MemberProfileFrame({super.key});

  static const _subtitleText = '自己紹介文';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiModel = ref.watch(memberProfileUiModelProvider);
    final bottomPadding = max<double>(
      MediaQuery.viewPaddingOf(context).bottom,
      16,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: ListView(
        padding: EdgeInsets.only(bottom: bottomPadding),
        children: [
          const DSProfileMainPhoto(),
          const DSDivider(),
          const DSSubtitle(text: _subtitleText),
          DSBodyText(text: uiModel.introductionText),
        ],
      ),
    );
  }
}
