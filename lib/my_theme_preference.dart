import 'package:shared_preferences/shared_preferences.dart';

import 'config/theme/app_theme.dart';

class MyThemePreferences {
  static const THEME_KEY = "theme_key";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    AppDynamicColorBuilder.isDarkMode = value;
    sharedPreferences.setBool(THEME_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    AppDynamicColorBuilder.isDarkMode = sharedPreferences.getBool(THEME_KEY) ?? false;
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }
}