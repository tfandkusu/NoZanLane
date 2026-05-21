import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: true,
    ),
  );
  FlutterError.onError = (errorDetails) {
    debugPrint('FlutterError: ${errorDetails.exceptionAsString()}');
    debugPrint('Stack trace:\n${errorDetails.stack}');
  };
  // Flutter フレームワーク外の未捕捉非同期エラーを debugPrint で出力する
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Uncaught async error: $error');
    debugPrint('Stack trace:\n$stack');
    return true;
  };
  runApp(const ProviderScope(child: App()));
}
