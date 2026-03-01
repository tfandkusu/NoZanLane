import 'package:flutter/material.dart';

/// 複数画面で利用可能な本文テキストコンポーネントです。
class DSBodyText extends StatelessWidget {
  /// [DSBodyText] を生成します。
  const DSBodyText({
    required this.text,
    super.key,
  });

  /// 本文として表示する文言です。
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
