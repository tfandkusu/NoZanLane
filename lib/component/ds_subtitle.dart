import 'package:flutter/material.dart';

/// 複数画面で利用可能なサブタイトルコンポーネントです。
class DSSubtitle extends StatelessWidget {
  /// [DSSubtitle] を生成します。
  const DSSubtitle({
    required this.text,
    super.key,
  });

  /// サブタイトルとして表示する文言です。
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: colorScheme.surface,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
