import 'package:flutter/material.dart';
import 'package:no_zan_lane/app/app_theme.dart';
import 'package:no_zan_lane/app/router.dart';
import 'package:no_zan_lane/l10n/app_localizations.dart';

/// アプリケーションのルートウィジェットです。
class App extends StatelessWidget {
  /// [App] を生成します。
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      routerConfig: router,
      theme: appDarkTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
