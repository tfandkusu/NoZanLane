import 'package:go_router/go_router.dart';
import 'package:no_zan_lane/frame/counter/counter_frame.dart';

/// アプリケーションのルーター設定です。
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CounterFrame(),
    ),
  ],
);
