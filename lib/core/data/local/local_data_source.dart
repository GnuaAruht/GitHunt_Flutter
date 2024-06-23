import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class LocalDataSource {
  Future<List<LanguageModel>> getLanguageList();

  Future<void> saveLanguageList(List<LanguageModel> languages);
}

class LocalDataSourceImpl implements LocalDataSource {
  late Future<Isar> db;

  LocalDataSourceImpl() {
    db = openDB();
  }

  @override
  Future<void> saveLanguageList(List<LanguageModel> languages) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.languageModels.putAll(languages);
    });
  }

  @override
  Future<List<LanguageModel>> getLanguageList() async {
    final isar = await db;
    return await isar.languageModels.where().findAll();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([LanguageModelSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }
}
