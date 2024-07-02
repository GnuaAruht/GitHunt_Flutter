import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:githunt_flutter/core/config/app_theme.dart';
import 'package:githunt_flutter/core/config/injector.dart';
import 'package:githunt_flutter/core/config/route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await initDependencies();
  runApp(const GitHuntApp());
}

class GitHuntApp extends StatelessWidget {
  const GitHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter GitHunt',
      theme: AppTheme.buildLightTheme(),
      routerConfig: appRouter,
      builder: FlutterSmartDialog.init(),
    );
  }

}