import 'package:flutter/material.dart';

/// 複数画面で利用可能なプロフィール写真コンポーネントです。
class DSProfileMainPhoto extends StatelessWidget {
  /// [DSProfileMainPhoto] を生成します。
  const DSProfileMainPhoto({
    required this.imageProvider,
    super.key,
    this.backgroundColor = Colors.white,
  });

  /// 表示する写真データです。
  final ImageProvider<Object> imageProvider;

  /// 写真の背面に敷く背景色です。
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox.expand(),
          ),
        ),
      ),
    );
  }
}
