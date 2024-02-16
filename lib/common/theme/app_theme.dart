import 'package:flutter/material.dart';

import '../enums/theme_type.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getTheme(BuildContext context) {
    final Brightness platformBrightness =
        MediaQuery.of(context).platformBrightness;

    switch (platformBrightness) {
      case Brightness.light:
        return lightTheme();
      case Brightness.dark:
        return darkTheme();
      default:
        return lightTheme();
    }
  }

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 16)
      )
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}
