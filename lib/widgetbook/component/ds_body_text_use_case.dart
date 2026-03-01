import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:no_zan_lane/component/ds_body_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: DSBodyText,
)
/// [DSBodyText] のデフォルトユースケースです。
Widget dsBodyTextUseCase(BuildContext context) {
  return const Scaffold(
    appBar: DSAppBar(titleText: 'DSBodyText'),
    body: DSBodyText(
      text:
          'はじめまして😊\n'
          '都内でIT系の仕事をしています。\n'
          '休日はカフェ巡りや映画を観たり、たまに旅行に行くのが好きです✈️\n'
          '\n'
          '周りからは落ち着いていると言われることが多いですが、仲良くなるとよく笑います。\n'
          '一緒に美味しいものを食べに行ったり、自然体でいられる関係になれたら嬉しいです。\n'
          'よろしくお願いします！',
    ),
  );
}
