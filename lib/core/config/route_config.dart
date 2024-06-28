import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/const/route_const.dart';
import 'package:githunt_flutter/features/main/main_page.dart';
import 'package:githunt_flutter/features/splash_page/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConst.splashPath,
  routes: [
    GoRoute(
      path: RouteConst.splashPath,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: RouteConst.mainPath,
      pageBuilder: (_, __) {
        return CustomTransitionPage<void>(
          child: const MainPage(),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
