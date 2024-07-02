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

  bool get firstLoading => _repositoriesData.isEmpty;

  Duration get diffDuration {
    switch (dateFilter) {
      case DateFilter.daily:
        return Duration.zero;
      case DateFilter.weekly:
        return const Duration(days: 7);
      case DateFilter.monthly:
        return const Duration(days: 30);
      case DateFilter.yearly:
        return const Duration(days: 365);
    }
  }

  DateTime fromDate = DateTime.now();
  DateTime get toDate => fromDate.subtract(diffDuration);

  MainProvider({required this.repository}) {
    _startDataLoading();
  }

  void _resetData() {
    _repositoriesData.clear();
    fromDate = DateTime.now();
  }

  void _startDataLoading() {
    _resetData();
    _getRepositories();
  }

  Future<void> _getRepositories() async {
    _uiState = const UIState.loading();
    notifyListeners();

    final result = await repository.getRepositoryList(
      language: language,
      fromDate: fromDate,
      toDate: toDate,
    );

    result.when(
      success: (data) {
        _repositoriesData = List.of(_repositoriesData)..add(data);
        _uiState = const UIState.success();
        fromDate = toDate.subtract(const Duration(days: 1));
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

}
