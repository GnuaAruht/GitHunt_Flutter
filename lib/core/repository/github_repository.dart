import 'dart:io';
import 'package:dio/dio.dart';
import 'package:yaml/yaml.dart';
import 'package:githunt_flutter/core/config/data_state.dart';
import 'package:githunt_flutter/core/data/remote/remote_data_source.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class GithubRepository {
  Future<DataState<List<LanguageModel>>> getLanguageList();
}

const _unknownError = "Something went wrong";

class GithubRepositoryImpl implements GithubRepository {

  final RemoteDataSource remote;

  GithubRepositoryImpl({required this.remote});

  @override
  Future<DataState<List<LanguageModel>>> getLanguageList() async {
    return _getLanguagesFromRemote();
  }

  Future<DataState<List<LanguageModel>>> _getLanguagesFromRemote() async {
    try {
      final response = await remote.getLanguagesContent();
      if (response.statusCode == HttpStatus.ok) {
        final languages = <LanguageModel>[];
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
        return DataState.success(languages);
      } else {
        return DataState.failure(response.statusMessage ?? _unknownError);
      }
    } on DioException catch (e) {
      return DataState.failure(e.message ?? _unknownError);
    }
  }


}
