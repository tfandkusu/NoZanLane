import 'package:flutter/material.dart';

/// 複数画面で利用可能なキャンペーンバナーです。
class DSCampaignBanner extends StatelessWidget {
  /// [DSCampaignBanner] を生成します。
  const DSCampaignBanner({
    required this.text,
    super.key,
    this.backgroundColor = const Color(0xFFFF9800),
  });

  /// バナーに表示する文言です。
  final String text;

  /// バナー背景色です。
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: SizedBox(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
