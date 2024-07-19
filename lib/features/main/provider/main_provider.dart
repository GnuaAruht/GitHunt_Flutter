import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/model/repositories_data.dart';
import 'package:githunt_flutter/core/repository/app_repository.dart';

class MainProvider extends ChangeNotifier {

  final AppRepository repository;

  // date filter
  late DateFilter _dateFilter;
  DateFilter get dateFilter => _dateFilter;

  // language
  late String _language;
  String get language => _language;

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
    _initDataLoading();
  }

  Future<void> _initDataLoading() async {
    await _getSavedLanguage();
    await _getSaveDateFilter();
    _startDataLoading();
  }

  Future<void> _getSavedLanguage() async {
    _language = await repository.getSavedLang();
  }

  Future<void> _getSaveDateFilter() async {
    _dateFilter = await repository.getSavedDateFilter();
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

  Future<void> updateLanguage(String language) async {
    if (_language != language) {
      _language = language;
      await repository.saveLanguage(language);
      notifyListeners();
      _startDataLoading();
    }
  }

  Future<void> updateDateFilter(DateFilter dateFilter) async {
    if (_dateFilter != dateFilter) {
      _dateFilter = dateFilter;
      await repository.saveDateFilter(dateFilter);
      notifyListeners();
      _startDataLoading();
    }
  }

  void reloadNextData() => _getRepositories();

  Color? getColorByLanguageName(String? name) {
    return repository.getColorByLanguageName(name);
  }

}
