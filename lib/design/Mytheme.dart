import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK, DARKER }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.green,
    brightness: Brightness.light,
    canvasColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.green[900],
    brightness: Brightness.dark,
    backgroundColor: Colors.black26,

  );

  static final ThemeData darkerTheme = ThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
    accentColor: Colors.white,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      case MyThemeKeys.DARKER:
        return darkerTheme;
      default:
        return lightTheme;
    }
  }
}