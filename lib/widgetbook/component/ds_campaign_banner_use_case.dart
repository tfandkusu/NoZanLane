import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_campaign_banner.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: DSCampaignBanner,
)
/// [DSCampaignBanner] のデフォルトユースケースです。
Widget dsCampaignBannerDefaultUseCase(BuildContext context) {
  return const Scaffold(
    body: Center(
      child: SizedBox(
        width: 320,
        child: DSCampaignBanner(text: 'キャンペーンテキスト'),
      ),
    ),
  );
}
