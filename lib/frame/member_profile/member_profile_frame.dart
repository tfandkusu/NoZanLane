import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
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

    return Scaffold(
      appBar: const DSAppBar(titleText: '28才 東京都'),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: DSProfileMainPhoto(),
          ),
          const SliverToBoxAdapter(
            child: DSDivider(),
          ),
          const SliverToBoxAdapter(
            child: DSSubtitle(text: _subtitleText),
          ),
          SliverToBoxAdapter(
            child: DSBodyText(text: uiModel.introductionText),
          ),
          const SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              left: false,
              right: false,
              child: SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
