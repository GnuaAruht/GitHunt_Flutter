import 'package:githunt_flutter/core/const/route_const.dart';
import 'package:githunt_flutter/features/language/language_filter_bottom_sheet.dart';
import 'package:githunt_flutter/features/language/provider/language_provider.dart';
import 'package:githunt_flutter/features/main/main_page.dart';
import 'package:githunt_flutter/main.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: RouteConst.mainPath,
      builder: (_, __) => const MainPage(),
      routes: [
        // GoRoute(
        //   path: RouteConst.languageFilter,
        //   builder: (_, __) {
        //     return ChangeNotifierProvider(
        //       create: (_) => LanguageProvider(repository: injector.get()),
        //       child: const LanguageFilterPage(),
        //     );
        //   },
        // )
      ],
    ),
  ],
);
