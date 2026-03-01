import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:no_zan_lane/component/ds_subtitle.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: DSSubtitle,
)
/// [DSSubtitle] のデフォルトユースケースです。
Widget dsSubtitleUseCase(BuildContext context) {
  return const Scaffold(
    appBar: DSAppBar(titleText: 'DSSubtitle'),
    body: DSSubtitle(text: '自己紹介文'),
  );
}
