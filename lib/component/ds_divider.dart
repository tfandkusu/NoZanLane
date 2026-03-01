import 'package:flutter/material.dart';

/// 複数画面で利用可能な区切り線コンポーネントです。
class DSDivider extends StatelessWidget {
  /// [DSDivider] を生成します。
  const DSDivider({
    super.key,
    this.color = const Color(0xFFD5C3B5),
    this.thickness = 1,
  });

  /// 区切り線の色です。
  final Color color;

  /// 区切り線の太さです。
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: thickness,
      child: ColoredBox(color: color),
    );
  }
}
