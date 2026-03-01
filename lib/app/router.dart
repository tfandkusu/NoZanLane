import 'package:go_router/go_router.dart';
import 'package:no_zan_lane/frame/member_profile/member_profile_frame.dart';

/// アプリケーションのルーター設定です。
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MemberProfileFrame(),
    ),
  ],
);
