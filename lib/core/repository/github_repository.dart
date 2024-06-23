import 'dart:io';
import 'package:dio/dio.dart';
import 'package:githunt_flutter/core/data/local/local_data_source.dart';
import 'package:yaml/yaml.dart';
import 'package:githunt_flutter/core/config/data_state.dart';
import 'package:githunt_flutter/core/data/remote/remote_data_source.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class GithubRepository {
  Future<DataState<List<LanguageModel>>> getLanguageList();
}

const _unknownError = "Something went wrong";

class GithubRepositoryImpl implements GithubRepository {

  final LocalDataSource local;
  final RemoteDataSource remote;

  GithubRepositoryImpl({required this.local, required this.remote});

  @override
  Future<DataState<List<LanguageModel>>> getLanguageList() async {
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

  Future<List<LanguageModel>> _getLanguagesFromRemote() async {
    final languages = <LanguageModel>[];
    final response = await remote.getLanguagesContent();
    final yamlMap = loadYaml(response.data) as Map;
    yamlMap.forEach((key, value) {
      if (value['color'] != null) {
        languages.add(
          LanguageModel(
            name: key.toString(),
            colorCode: value['color'],
          ),
        );
      }
    });
    return languages;
  }

}
