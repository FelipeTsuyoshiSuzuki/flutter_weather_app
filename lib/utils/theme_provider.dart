import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/utils/global_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeDataStyle = GlobalTheme(GlobalTextTheme.globalTextTheme).light();

  ThemeData get themeDataStyle => _themeDataStyle;

  set themeDataStyle(ThemeData themeData) {
    _themeDataStyle = themeData;
    notifyListeners();
  }

  void changeTheme() {
    if (_themeDataStyle == GlobalTheme(GlobalTextTheme.globalTextTheme).light()) {
      themeDataStyle = GlobalTheme(GlobalTextTheme.globalTextTheme).darkHighContrast();
      log("tema claro");
      log(themeDataStyle.toString());
    } else {
      themeDataStyle = GlobalTheme(GlobalTextTheme.globalTextTheme).light();
    }
    log("tema escuro");
    log(themeDataStyle.toString());
  }
}
