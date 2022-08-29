import 'package:flutter/material.dart';

ThemeData exagramThemeLight() {
  return ThemeData(
      primaryColor: AppColor.blue200,
      primarySwatch: Colors.red,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 40.0),
        headline2: TextStyle(fontSize: 33.0),
        headline3: TextStyle(fontSize: 27.0),
        headline4: TextStyle(fontSize: 23.0),
        headline5: TextStyle(fontSize: 19.0),
        headline6: TextStyle(fontSize: 16.0),
      ));
}

ThemeData exagramThemeDark() {
  return ThemeData();
}

class AppColor extends Color {
  AppColor(super.value);

  static const blue100 = Color(0xFF3EADCF);
  static const blue200 = Color(0xFFABE9CD);
}
