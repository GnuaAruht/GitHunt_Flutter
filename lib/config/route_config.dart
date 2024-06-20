import 'package:githunt_flutter/const/route_const.dart';
import 'package:githunt_flutter/main/main_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: RouteConst.mainPath,
      builder: (_, __) => const MainPage(),
    ),
  ],
);
