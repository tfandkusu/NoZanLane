import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:no_zan_lane/component/ds_profile_main_photo.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: DSProfileMainPhoto,
)
/// [DSProfileMainPhoto] のデフォルトユースケースです。
Widget dsProfileMainPhotoUseCase(BuildContext context) {
  return const Scaffold(
    appBar: DSAppBar(titleText: 'DSProfileMainPhoto'),
    body: Center(
      child: DSProfileMainPhoto(
        imageProvider: NetworkImage('https://picsum.photos/id/1027/640/640'),
      ),
    ),
  );
}
