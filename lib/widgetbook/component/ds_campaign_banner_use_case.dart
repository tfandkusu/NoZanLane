import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:no_zan_lane/component/ds_campaign_banner.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: DSCampaignBanner,
)
/// [DSCampaignBanner] のデフォルトユースケースです。
Widget dsCampaignBannerUseCase(BuildContext context) {
  return const Scaffold(
    appBar: DSAppBar(titleText: 'DSCampaignBanner'),
    body: DSCampaignBanner(text: 'キャンペーンテキスト'),
  );
}
