import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:githunt_flutter/core/repository/github_repository.dart';

class LanguageProvider extends ChangeNotifier {

  final GithubRepository repository;

  // ui state
  UIState _uiState = const UIState.init();
  UIState get uiState => _uiState;

  // language list
  final List<LanguageModel> _languages = [];
  List<LanguageModel> _filteredLanguage = [];
  List<LanguageModel> get languages => _filteredLanguage;

  LanguageProvider({required this.repository}) {
    _getLanguageList();
  }

  Future<void> _getLanguageList() async {
    _uiState = const UIState.loading();
    notifyListeners();
    final dataState = await repository.getLanguageList();
    dataState.when(success: (data) {
      _uiState = const UIState.success();
      _languages..clear()..insert(0, LanguageModel.allLanguage())..addAll(data);
      _filteredLanguage = _languages;
      notifyListeners();
    }, failure: (msg) {
      _uiState = UIState.error(msg);
      notifyListeners();
    });
  }

  void searchLanguage(String query)  {
    if (query.isEmpty) {
      _filteredLanguage = _languages;
    } else {
      _filteredLanguage = _languages
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }


}
