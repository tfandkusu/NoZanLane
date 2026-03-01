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
        imageUrl:
            'https://private-user-images.githubusercontent.com/16898831/556542582-23a1cf6b-efbe-4dcd-b997-01f30455e68a.jpg?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzIzNTgyOTQsIm5iZiI6MTc3MjM1Nzk5NCwicGF0aCI6Ii8xNjg5ODgzMS81NTY1NDI1ODItMjNhMWNmNmItZWZiZS00ZGNkLWI5OTctMDFmMzA0NTVlNjhhLmpwZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNjAzMDElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjYwMzAxVDA5Mzk1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWNiOTk5MDY0OWIyY2RlYjAyMjU4ZWNiZjc1MmU3MTgwMGZiZDY0ZTc2YjNkZTk0NGQyOWQ3YTFhNzlkOTcyZTMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.FW6pleBNIg7EchARhGBx2ukVeudqZmee95bZyYmsNAk',
      ),
    ),
  );
}
