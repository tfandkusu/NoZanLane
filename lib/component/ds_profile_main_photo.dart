import 'package:flutter/material.dart';

/// 複数画面で利用可能なプロフィール写真コンポーネントです。
class DSProfileMainPhoto extends StatelessWidget {
  /// [DSProfileMainPhoto] を生成します。
  const DSProfileMainPhoto({
    required this.imageUrl,
    super.key,
  });

  /// 表示する写真の URL です。
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const SizedBox.expand(),
        ),
      ),
    );
  }
}
