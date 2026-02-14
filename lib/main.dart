import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:no_zan_lane/app/app.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
