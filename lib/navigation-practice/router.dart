import 'package:flutter_bloc_lab/navigation-practice/screen_a.dart';
import 'package:flutter_bloc_lab/navigation-practice/screen_b.dart';
import 'package:flutter_bloc_lab/navigation-practice/screen_c.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ScreenA(),
    ),

    GoRoute(path: '/screenb',
    builder: (context, state) => const ScreenB(),
    ),

    GoRoute(
      path: '/screenc',
      builder: (context, state) {
        final data = state.extra as String;
        return ScreenC(message: data);
      },)
  ],
);