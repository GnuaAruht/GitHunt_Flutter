import 'package:flutter/material.dart';
import 'package:githunt_flutter/config/app_theme.dart';
import 'package:githunt_flutter/config/route_config.dart';

void main() {
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
    );
  }
}
