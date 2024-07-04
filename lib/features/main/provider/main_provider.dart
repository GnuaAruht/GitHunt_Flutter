import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:githunt_flutter/core/model/repositories_data.dart';
import 'package:githunt_flutter/core/repository/app_repository.dart';

class MainProvider extends ChangeNotifier {

  final AppRepository repository;

  // date filter
  DateFilter _dateFilter = DateFilter.daily;
  DateFilter get dateFilter => _dateFilter;

  // language
  Language _language = Language.allLanguage;
  Language get language => _language;

  // ui state
  UIState _uiState = const UIState.init();
  UIState get uiState => _uiState;

  List<RepositoriesData> _repositoriesData = [];
  List<RepositoriesData> get repositoriesData => _repositoriesData;

  bool get firstLoading {
    return _repositoriesData.isEmpty && _uiState is UIStateLoading;
  }

  late DateTime _toDate;
  DateTime get _fromDate {
    switch (dateFilter) {
      case DateFilter.daily:
        return _toDate.copyWith(day: _toDate.day - 1);
      case DateFilter.weekly:
        return _toDate.copyWith(day: _toDate.day - 7);
      case DateFilter.monthly:
        return _toDate.copyWith(month: _toDate.month - 1);
      case DateFilter.yearly:
        return _toDate.copyWith(year: _toDate.year - 1);
    }
  }

  MainProvider({required this.repository}) {
    _startDataLoading();
  }

  void _startDataLoading() {
    _resetData();
    _getRepositories();
  }

  void _resetData() {
    final now = DateTime.now();
    _toDate = DateTime(now.year, now.month, now.day);
    _repositoriesData.clear();
  }

  Future<void> _getRepositories() async {

    _uiState = const UIState.loading();
    notifyListeners();

    final result = await repository.getRepositoryList(
      language: language,
      fromDate: _fromDate,
      toDate: _toDate,
    );

    result.when(
      success: (data) {
        _repositoriesData = List.of(_repositoriesData)..add(data);
        _uiState = const UIState.success();
        _toDate = _fromDate;
        notifyListeners();
      },
      failure: (msg) {
        _uiState = UIState.error(msg);
        notifyListeners();
      },
    );

  }

  void updateLanguage(Language language) {
    if (_language.value != language.value) {
      _language = language;
      notifyListeners();
      _startDataLoading();
    }
  }

  void updateDateFilter(DateFilter dateFilter) {
    if (_dateFilter != dateFilter) {
      _dateFilter = dateFilter;
      notifyListeners();
      _startDataLoading();
    }
  }

  void reloadNextData() => _getRepositories();

  Future<void> saveGithubToken(String token) {
    return repository.saveGithubToken(token);
  }

  Future<Language?> getLanguageByName(String languageName) {
    return repository.getLanguageByName(languageName);
  }

}
