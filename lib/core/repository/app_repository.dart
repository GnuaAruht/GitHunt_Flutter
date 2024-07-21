import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/core/data/local/local_data_source.dart';
import 'package:githunt_flutter/core/model/error_model.dart';
import 'package:githunt_flutter/core/model/repository.dart';
import 'package:githunt_flutter/core/model/repositories_data.dart';
import 'package:githunt_flutter/core/config/data_state.dart';
import 'package:githunt_flutter/core/data/remote/remote_data_source.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class AppRepository {
  Color? getColorByLanguageName(String? name);

  List<Language> getLanguageList();

  Future<void> saveGithubToken(String token);

  Future<String?> getGitHubToken();

  Future<bool> checkIfTokenAdded();

  Future<void> clearGitHubToken();

  Future<DataState<RepositoriesData>> getRepositoryList({
    required String language,
    required DateTime fromDate,
    required DateTime toDate,
  });

  Future<String> getSavedLang();

  Future<void> saveLanguage(String language);

  Future<DateFilter> getSavedDateFilter();

  Future<void> saveDateFilter(DateFilter dateFilter);

  Future<void> markAsBannerClosed();

  Future<bool> checkIfBannerClosed();

  Future<void> saveThemeMode(ThemeMode themeMode);

  Future<ThemeMode> getThemeMode();
}

class AppRepositoryImpl with ErrorConvertable implements AppRepository {

  final LocalDataSource local;
  final RemoteDataSource remote;

  AppRepositoryImpl({required this.local, required this.remote});

  @override
  Future<String> getSavedLang() => local.getLanguage();

  @override
  Future<void> saveLanguage(String language) => local.saveLanguage(language);

  @override
  Future<DateFilter> getSavedDateFilter() => local.getDateFilter();

  @override
  Future<void> saveDateFilter(DateFilter dateFilter) =>
      local.saveDateFilter(dateFilter);

  @override
  Future<DataState<RepositoriesData>> getRepositoryList({
    required String language,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    try {
      final String? pat = await local.getGitHubToken();
      final result = await remote.getRepositoryList(
        pat,
        language,
        fromDate,
        toDate,
      );
      final repositoriesData = RepositoriesData(
        fromDate: fromDate,
        toDate: toDate,
        repositories: (result.data["items"] as List)
            .map((e) => Repository.fromJson(e))
            .toList(),
      );
      return DataState.success(repositoriesData);
    } on DioException catch (e) {
      return DataState.failure(convertError(e));
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
  Future<bool> checkIfTokenAdded() {
    return local.checkIfTokenAdded();
  }

  @override
  Future<void> clearGitHubToken() {
    return local.clearGitHubToken();
  }

  @override
  List<Language> getLanguageList() => local.getLanguageList();

  @override
  Color? getColorByLanguageName(String? name) {
    return local.getColorByLanguageName(name);
  }

  @override
  Future<void> markAsBannerClosed() {
    return local.markAsBannerClosed();
  }

  @override
  Future<bool> checkIfBannerClosed() {
    return local.checkIfBannerClosed();
  }

  @override
  Future<ThemeMode> getThemeMode() {
    return local.getThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) {
    return local.saveThemeMode(themeMode);
  }
}

mixin ErrorConvertable {
  Error convertError(DioException e) {
    late Error error;
    switch (e.type) {
      case DioExceptionType.badResponse:
        final response = e.response!;
        error = Error(
          code: response.statusCode!,
          message: response.statusMessage!,
        );
      case DioExceptionType.connectionError:
        error = Error.connectionError();
      case DioExceptionType.connectionTimeout:
        error = Error.connectionTimeOut();
      default:
        error = Error.unknown();
    }
    return error;
  }
}

// Future<List<Language>> _getLanguagesFromRemote() async {
//   final languages = <Language>[];
//   final response = await remote.getLanguagesContent();
//   final yamlMap = loadYaml(response.data) as Map;
//   yamlMap.forEach((key, value) {
//     if (value['color'] != null) {
//       languages.add(
//         Language(
//           title: key.toString(),
//           value: key.toString(),
//           colorCode: value['color'],
//         ),
//       );
//     }
//   });
//   return languages;
// }
