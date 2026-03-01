import 'package:flutter/material.dart';
import 'package:no_zan_lane/app/app_theme.dart';
import 'package:no_zan_lane/widgetbook/app.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// Widgetbook のルートウィジェットです。
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  /// [WidgetbookApp] を生成します。
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      lightTheme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.light,
      directories: directories,
      addons: [
        ViewportAddon([
          IosViewports.iPhone12Mini,
          ...Viewports.all.where(
            (viewport) => viewport != IosViewports.iPhone12Mini,
          ),
        ]),
      ],
    );
  }
}
