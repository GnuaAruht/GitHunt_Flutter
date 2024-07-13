import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:githunt_flutter/core/repository/app_repository.dart';

class LanguageProvider extends ChangeNotifier {

  final AppRepository repository;

  // language list
  final List<Language> _languages = [];
  List<Language> _filteredLanguage = [];
  List<Language> get languages => _filteredLanguage;

  LanguageProvider({required this.repository}) {
    _getLanguageList();
  }

  Future<void> _getLanguageList() async {
    final languageList = repository.getLanguageList();
    _languages..clear()..insert(0, Language.allLanguage)..addAll(languageList);
    _filteredLanguage = _languages;
    notifyListeners();
  }

  void searchLanguage(String query)  {
    if (query.isEmpty) {
      _filteredLanguage = _languages;
    } else {
      _filteredLanguage = _languages
          .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }


}
