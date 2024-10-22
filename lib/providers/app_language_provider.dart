import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String _appLanguage = 'en';
  Locale get appLocale => Locale(_appLanguage);
  String get appLanguage => _appLanguage;

  ThemeMode _appTheme = ThemeMode.dark;
  ThemeMode get appTheme => _appTheme;

  void changeLanguage(String newLanguage) {
    if (_appLanguage == newLanguage) {
      return;
    }
    _appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (_appTheme == newMode) {
      return;
    }
    _appTheme = newMode;
    notifyListeners();
  }
}