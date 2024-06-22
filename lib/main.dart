import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:githunt_flutter/core/config/app_theme.dart';
import 'package:githunt_flutter/core/config/route_config.dart';
import 'package:githunt_flutter/core/data/remote/remote_data_source.dart';
import 'package:githunt_flutter/core/repository/github_repository.dart';

GetIt injector = GetIt.instance;

Future<void> initDependencies() async {
  _injectLocalDataSource();
  _injectRemoteDataSource();
  _injectRepositories();
}

void _injectLocalDataSource() {}

void _injectRemoteDataSource() {
  injector.registerLazySingleton(() => Dio());
  injector.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(injector.get()));
}

void _injectRepositories() {
  injector.registerFactory<GithubRepository>(
      () => GithubRepositoryImpl(remote: injector.get()));
}

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
    );
  }
}
