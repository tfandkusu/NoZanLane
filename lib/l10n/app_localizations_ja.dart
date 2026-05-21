// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'NoZanLane';

  @override
  String get counterPageTitle => 'カウンター';

  @override
  String get counterDescription => 'ボタンを押した回数です:';

  @override
  String get incrementButtonTooltip => '増やす';

  @override
  String get memberProfileLoadError => '読み込みに失敗しました';

  @override
  String get memberProfileRetry => '再試行';
}
