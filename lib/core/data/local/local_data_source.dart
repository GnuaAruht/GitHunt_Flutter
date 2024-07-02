import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalDataSource {
  Future<List<Language>> getLanguageList();
  Future<void> saveLanguageList(List<Language> languages);
  Future<void> saveGitHubToken(String token);
  Future<String?> getGitHubToken();
}

const _githubTokenKey = "githubToken";

class LocalDataSourceImpl implements LocalDataSource {
  
  late Future<Isar> _db;
  final _secureStorage = const FlutterSecureStorage();

  LocalDataSourceImpl() {
    _db = openDB();
  }

  @override
  Future<void> saveLanguageList(List<Language> languages) async {
    final isar = await _db;
    await isar.writeTxn(() async {
      await isar.languages.putAll(languages);
    });
  }

  @override
  Future<List<Language>> getLanguageList() async {
    final isar = await _db;
    return await isar.languages.where().findAll();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([LanguageSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> saveGitHubToken(String token) async {
    await _secureStorage.write(key: _githubTokenKey, value: token);
  }

  @override
  Future<String?> getGitHubToken() async {
    return await _secureStorage.read(key: _githubTokenKey);
  }

}
