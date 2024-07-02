import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/injector.dart';
import 'package:githunt_flutter/core/const/route_const.dart';
import 'package:githunt_flutter/features/main/main_page.dart';
import 'package:githunt_flutter/features/main/provider/main_provider.dart';
import 'package:githunt_flutter/features/splash_page/splash_page.dart';
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
      pageBuilder: (_, __) {
        return _FadeTransitionPage(
          child: ChangeNotifierProvider(
            create: (_) => MainProvider(repository: injector.get()),
            child: const MainPage(),
          ),
        );
      },
    ),
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
