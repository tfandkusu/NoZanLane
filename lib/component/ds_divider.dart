import 'package:flutter/material.dart';

/// 複数画面で利用可能な区切り線コンポーネントです。
class DSDivider extends StatelessWidget {
  /// [DSDivider] を生成します。
  const DSDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 1,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.outlineVariant,
      ),
    );
  }
}
