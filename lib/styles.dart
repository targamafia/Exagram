import 'package:flutter/material.dart';

ThemeData exagramThemeLight() {
  return ThemeData(
      primaryColor: AppColorLight.primary,
      errorColor: AppColorLight.error,
      primarySwatch: AppColorLight.materialPrimary,
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

class AppColorLight extends Color {
  AppColorLight(super.value);

  static const primary = Color(0xFF4059AD);
  static const materialPrimary = MaterialColor(0xFF4059AD, {
    50: Color.fromRGBO(64, 89, 173, .1),
    100: Color.fromRGBO(64, 89, 173, .2),
    200: Color.fromRGBO(64, 89, 173, .3),
    300: Color.fromRGBO(64, 89, 173, .4),
    400: Color.fromRGBO(64, 89, 173, .5),
    500: Color.fromRGBO(64, 89, 173, .6),
    600: Color.fromRGBO(64, 89, 173, .7),
    700: Color.fromRGBO(64, 89, 173, .8),
    800: Color.fromRGBO(64, 89, 173, .9),
    900: Color.fromRGBO(64, 89, 173, 1),
  });

  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFDCE1FF);
  static const onPrimaryContainer = Color(0xFF00163F);

  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF410002);

  static const background = Color(0xFFFEFBFF);
  static const onBackground = Color(0xFF1B1B1F);
  static const surface = Color(0xFFFEFBFF);
  static const onSurface = Color(0xFF1B1B1F);

  static const surfaceVariant = Color(0xFFE5E5E5);
  static const onSurfaceVariant = Color(0xFF45464F);
  static const outline = Color(0xFF767680);

  static const blue100 = Color(0xFF3EADCF);
  static const blue200 = Color(0xFFABE9CD);
}
