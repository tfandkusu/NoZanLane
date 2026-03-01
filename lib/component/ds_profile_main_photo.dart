import 'package:flutter/material.dart';

/// 複数画面で利用可能なプロフィール写真コンポーネントです。
class DSProfileMainPhoto extends StatelessWidget {
  /// [DSProfileMainPhoto] を生成します。
  const DSProfileMainPhoto({
    required this.imageProvider,
    super.key,
    this.width = 320,
    this.height = 320,
    this.backgroundColor = Colors.white,
  });

  /// 表示する写真データです。
  final ImageProvider<Object> imageProvider;

  /// 写真表示領域の横幅です。
  final double width;

  /// 写真表示領域の高さです。
  final double height;

  /// 写真の背面に敷く背景色です。
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final resolvedWidth = width == 320 && constraints.hasBoundedWidth
            ? constraints.maxWidth
            : width;

        return ColoredBox(
          color: backgroundColor,
          child: SizedBox(
            width: resolvedWidth,
            height: height,
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.expand(),
            ),
          ),
        );
      },
    );
  }
}
