import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:githunt_flutter/core/data/local/local_data_source.dart';
import 'package:githunt_flutter/core/data/remote/remote_data_source.dart';
import 'package:githunt_flutter/core/repository/app_repository.dart';

GetIt injector = GetIt.instance;

Future<void> initDependencies() async {
  _injectLocalDataSource();
  _injectRemoteDataSource();
  _injectRepositories();
}

void _injectLocalDataSource() {
  injector.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}

void _injectRemoteDataSource() {
  injector.registerLazySingleton(() => Dio());
  injector.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(injector.get()));
}

void _injectRepositories() {
  injector.registerFactory<AppRepository>(() =>
      AppRepositoryImpl(local: injector.get(), remote: injector.get()));
}
