import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/repository/app_repository.dart';

class ThemeProvider extends ChangeNotifier {

  final AppRepository repository;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  static Future<ThemeProvider> create({required AppRepository repo}) async {
    final themeMode = await repo.getThemeMode();
    return ThemeProvider._(repository: repo, themeMode: themeMode);
  }

  ThemeProvider._({required this.repository,required ThemeMode themeMode}) {
    _themeMode = themeMode;
  }

  void changeTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    repository.saveThemeMode(themeMode);
    notifyListeners();
  }

}