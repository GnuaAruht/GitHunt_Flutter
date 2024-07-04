import 'package:dio/dio.dart';
import 'package:githunt_flutter/core/data/local/local_data_source.dart';
import 'package:githunt_flutter/core/model/repository.dart';
import 'package:githunt_flutter/core/model/repositories_data.dart';
import 'package:yaml/yaml.dart';
import 'package:githunt_flutter/core/config/data_state.dart';
import 'package:githunt_flutter/core/data/remote/remote_data_source.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class AppRepository {
  Future<DataState<List<Language>>> getLanguageList();
  Future<Language?> getLanguageByName(String languageName);
  Future<void> saveGithubToken(String token);
  Future<String?> getGitHubToken();
  Future<DataState<RepositoriesData>> getRepositoryList({
    required Language language,
    required DateTime fromDate,
    required DateTime toDate,
  });
}

const _unknownError = "Something went wrong";

class AppRepositoryImpl implements AppRepository {
  final LocalDataSource local;
  final RemoteDataSource remote;

  AppRepositoryImpl({required this.local, required this.remote});

  @override
  Future<DataState<RepositoriesData>> getRepositoryList({
    required Language language,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      final result = await remote.getRepositoryList(language, fromDate, toDate);
      final repositoriesData = RepositoriesData(
        fromDate: fromDate,
        toDate: toDate,
        repositories: (result.data["items"] as List)
            .map((e) => Repository.fromJson(e))
            .toList(),
      );
      return DataState.success(repositoriesData);
    } on DioException catch (e) {
      return DataState.failure(e.response?.statusMessage ?? _unknownError);
    }
  }

  @override
  Future<void> saveGithubToken(String token) {
    return local.saveGitHubToken(token);
  }

  @override
  Future<String?> getGitHubToken() {
    return local.getGitHubToken();
  }

  @override
  Future<DataState<List<Language>>> getLanguageList() async {
    final languagesFromLocal = await local.getLanguageList();
    if (languagesFromLocal.isNotEmpty) {
      return DataState.success(languagesFromLocal);
    }
    try {
      final languagesFromRemote = await _getLanguagesFromRemote();
      local.saveLanguageList(languagesFromRemote);
      return DataState.success(languagesFromRemote);
    } on DioException catch (e) {
      return DataState.failure(e.message ?? _unknownError);
    }
  }

  Future<List<Language>> _getLanguagesFromRemote() async {
    final languages = <Language>[];
    final response = await remote.getLanguagesContent();
    final yamlMap = loadYaml(response.data) as Map;
    yamlMap.forEach((key, value) {
      if (value['color'] != null) {
        languages.add(
          Language(
            title: key.toString(),
            value: key.toString(),
            colorCode: value['color'],
          ),
        );
      }
    });
    return languages;
  }

  @override
  Future<Language?> getLanguageByName(String languageName) {
    return local.getLanguageByName(languageName);
  }

}
