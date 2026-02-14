import 'package:go_router/go_router.dart';
import 'package:no_zan_lane/features/counter/presentation/counter_page.dart';

/// Router configuration for the application.
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CounterPage(),
    ),
  ],
);
