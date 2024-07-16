import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/core/config/string_ext.dart';
import 'package:githunt_flutter/core/data/local/language_map.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  List<Language> getLanguageList();
  Color? getColorByLanguageName(String? name);
  Future<void> saveGitHubToken(String token);
  Future<String?> getGitHubToken();
  Future<bool> checkIfTokenAdded();
  Future<void> saveDateFilter(DateFilter dateFilter);
  Future<DateFilter> getDateFilter();
  Future<void> saveLanguage(String language);
  Future<String> getLanguage();
  Future<void> markAsBannerClosed();
  Future<bool> checkIfBannerClosed();
}

const _githubTokenKey = "githubToken";
const _dateFilter = "dateFilter";
const _languageFilter = "languageFilter";
const _bannerClosed = "bannerClosed";

class LocalDataSourceImpl implements LocalDataSource {
  final _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> markAsBannerClosed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_bannerClosed, true);
  }

  @override
  Future<bool> checkIfBannerClosed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_bannerClosed) ?? false;
  }

  @override
  Future<void> saveDateFilter(DateFilter dateFilter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_dateFilter, dateFilter.index);
  }

  @override
  Future<DateFilter> getDateFilter() async {
    final prefs = await SharedPreferences.getInstance();
    final dateFilter = DateFilter.values[prefs.getInt(_dateFilter) ?? 0];
    return dateFilter;
  }

  @override
  Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageFilter, language);
  }


  @override
  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageFilter) ?? allLanguages;
  }


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
