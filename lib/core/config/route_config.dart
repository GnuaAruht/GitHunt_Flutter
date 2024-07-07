import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/injector.dart';
import 'package:githunt_flutter/core/const/route_const.dart';
import 'package:githunt_flutter/features/main/main_page.dart';
import 'package:githunt_flutter/features/main/provider/main_provider.dart';
import 'package:githunt_flutter/features/setting/setting_page.dart';
import 'package:githunt_flutter/features/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConst.splashPath,
  routes: [
    GoRoute(
      path: RouteConst.splashPath,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
        path: RouteConst.mainPath,
        builder: (_, __) {
          return ChangeNotifierProvider(
            create: (_) => MainProvider(repository: injector.get()),
            child: const MainPage(),
          );
        },
        routes: [
          GoRoute(
            path: RouteConst.setting,
            builder: (_, __) => const SettingPage(),
          ),
        ]),
  ],
);

class _FadeTransitionPage<T> extends CustomTransitionPage<T> {
  _FadeTransitionPage({required super.child})
      : super(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
}
