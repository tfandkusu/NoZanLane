import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: DSAppBar,
)
/// [DSAppBar] のデフォルトユースケースです。
Widget dsAppBarDefaultUseCase(BuildContext context) {
  return const Scaffold(
    appBar: DSAppBar(titleText: 'Widgetbook DSAppBar'),
    body: SizedBox.shrink(),
  );
}
