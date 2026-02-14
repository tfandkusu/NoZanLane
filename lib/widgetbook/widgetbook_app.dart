import 'package:flutter/material.dart';
import 'package:no_zan_lane/component/ds_app_bar.dart';
import 'package:widgetbook/widgetbook.dart';

/// Widgetbook のルートウィジェットです。
class WidgetbookApp extends StatelessWidget {
  /// [WidgetbookApp] を生成します。
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: Brightness.dark,
      ),
    );

    return Widgetbook.material(
      lightTheme: darkTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      directories: [
        WidgetbookFolder(
          name: 'Component',
          children: [
            WidgetbookComponent(
              name: 'DSAppBar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    return const Scaffold(
                      appBar: DSAppBar(titleText: 'Widgetbook DSAppBar'),
                      body: SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
