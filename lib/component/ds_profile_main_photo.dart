import 'package:flutter/material.dart';

/// 複数画面で利用可能なプロフィール写真コンポーネントです。
class DSProfileMainPhoto extends StatelessWidget {
  /// [DSProfileMainPhoto] を生成します。
  const DSProfileMainPhoto({super.key});
  static const _assetPath = 'assets/images/ds_profile_main_photo.jpg';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox.expand(),
        ),
      ),
    );
  }
}
