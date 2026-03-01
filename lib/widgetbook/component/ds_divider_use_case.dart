import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:no_zan_lane/component/ds_divider.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: DSDivider,
)
/// [DSDivider] のデフォルトユースケースです。
Widget dsDividerUseCase(BuildContext context) {
  return const Scaffold(
    appBar: DSAppBar(titleText: 'DSDivider'),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: DSDivider(),
      ),
    ),
  );
}
