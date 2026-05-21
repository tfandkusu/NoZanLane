import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/component/ds_body_text.dart';
import 'package:no_zan_lane/component/ds_divider.dart';
import 'package:no_zan_lane/component/ds_profile_main_photo.dart';
import 'package:no_zan_lane/component/ds_subtitle.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_provider.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_ui_model.dart';
import 'package:no_zan_lane/l10n/app_localizations.dart';

/// MemberProfile 画面の Frame 実装です。
class MemberProfileFrame extends HookConsumerWidget {
  /// [MemberProfileFrame] を生成します。
  const MemberProfileFrame({super.key});

  static const _subtitleText = '自己紹介文';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberProfileAsync = ref.watch(memberProfileProvider);
    final l10n = AppLocalizations.of(context)!;

    Future<void> onRefresh() =>
        ref.read(memberProfileProvider.notifier).refresh();

    return Scaffold(
      body: memberProfileAsync.when(
        skipLoadingOnRefresh: true,
        skipLoadingOnReload: true,
        data: (uiModel) => _MemberProfileRefreshableBody(
          onRefresh: onRefresh,
          children: _buildContentChildren(uiModel),
        ),
        error: (error, stackTrace) => _MemberProfileRefreshableBody(
          onRefresh: onRefresh,
          children: [
            _MemberProfileErrorBody(
              message: l10n.memberProfileLoadError,
              retryLabel: l10n.memberProfileRetry,
              onRetry: onRefresh,
            ),
          ],
        ),
        loading: () => _MemberProfileRefreshableBody(
          onRefresh: onRefresh,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContentChildren(MemberProfileUiModel uiModel) {
    return [
      const DSProfileMainPhoto(),
      const DSDivider(),
      const DSSubtitle(text: _subtitleText),
      DSBodyText(text: uiModel.introductionText),
      const SafeArea(
        top: false,
        left: false,
        right: false,
        child: SizedBox.shrink(),
      ),
    ];
  }
}

class _MemberProfileRefreshableBody extends StatelessWidget {
  const _MemberProfileRefreshableBody({
    required this.onRefresh,
    required this.children,
  });

  final Future<void> Function() onRefresh;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MemberProfileErrorBody extends StatelessWidget {
  const _MemberProfileErrorBody({
    required this.message,
    required this.retryLabel,
    required this.onRetry,
  });

  final String message;
  final String retryLabel;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onRetry,
              child: Text(retryLabel),
            ),
          ],
        ),
      ),
    );
  }
}
