import 'package:flutter/material.dart';

/// 複数画面で利用可能な共通 AppBar です。
class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// [DSAppBar] を生成します。
  const DSAppBar({
    required this.titleText,
    super.key,
    this.actions,
    this.onBackPressed,
  });

  /// タイトルとして表示する文字列です。
  final String titleText;

  /// 右側に表示するアクション群です。
  final List<Widget>? actions;

  /// 戻る操作時のコールバックです。指定時のみ戻るボタンを表示します。
  final VoidCallback? onBackPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      actions: actions,
      leading: onBackPressed == null
          ? null
          : IconButton(
              onPressed: onBackPressed,
              icon: const Icon(Icons.arrow_back),
            ),
    );
  }
}
