import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:githunt_flutter/core/config/string_ext.dart';
import 'package:githunt_flutter/core/data/local/language_map.dart';
import 'package:githunt_flutter/core/model/language_model.dart';

abstract class LocalDataSource {
  List<Language> getLanguageList();
  Color? getColorByLanguageName(String? name);
  Future<void> saveGitHubToken(String token);
  Future<String?> getGitHubToken();
  Future<bool> checkIfTokenAdded();
}

const _githubTokenKey = "githubToken";

class LocalDataSourceImpl implements LocalDataSource {
  final _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> saveGitHubToken(String token) async {
    await _secureStorage.write(key: _githubTokenKey, value: token);
  }

  @override
  Future<String?> getGitHubToken() async {
    return await _secureStorage.read(key: _githubTokenKey);
  }

  @override
  Future<bool> checkIfTokenAdded() async {
    final token = await getGitHubToken();
    return token != null;
  }

  @override
  List<Language> getLanguageList() {
    return languageMap.entries
        .map(
          (entry) => Language(
            title: entry.key,
            colorCode: entry.value,
          ),
        )
        .toList();
  }

  @override
  Color? getColorByLanguageName(String? name) {
    final colorCode = languageMap[name];
    return colorCode?.color;
  }
}
