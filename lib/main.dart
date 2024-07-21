import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:githunt_flutter/core/config/app_theme.dart';
import 'package:githunt_flutter/core/config/custom_timeago_message.dart';
import 'package:githunt_flutter/core/config/injector.dart';
import 'package:githunt_flutter/core/config/route_config.dart';
import 'package:githunt_flutter/pat_provider.dart';
import 'package:githunt_flutter/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  timeago.setLocaleMessages('en', CustomMessage());
  await initDependencies();
  final patProvider = await PATProvider.create(repo: injector.get());
  final themeProvider = await ThemeProvider.create(repo: injector.get());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider.value(value: patProvider)
      ],
      child: const GitHuntApp(),
    ),
  );
}

class GitHuntApp extends StatelessWidget {
  const GitHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ThemeProvider, ThemeMode>(
      selector: (_, provider) => provider.themeMode,
      builder: (_, themeMode, __) {
        return MaterialApp.router(
          title: 'Flutter GitHunt',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildLightTheme(),
          darkTheme: AppTheme.buildDarkTheme(),
          routerConfig: appRouter,
          themeMode: themeMode,
          builder: FlutterSmartDialog.init(),
        );
      },
    );
  }
}
