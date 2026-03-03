import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/app/app.dart';
import 'package:no_zan_lane/seed/seed_issue_loader.dart';
import 'package:no_zan_lane/seed/seed_issue_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final seedIssues = await SeedIssueLoader(
    assetBundle: rootBundle,
  ).load();
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
  runApp(
    ProviderScope(
      overrides: [seedIssueListProvider.overrideWithValue(seedIssues)],
      child: const App(),
    ),
  );
}
