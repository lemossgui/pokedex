import 'package:flutter/material.dart';
import 'package:pokedex/export.dart';

ThemeData theme = ThemeData(
  fontFamily: 'Raleway',
  backgroundColor: backgroundLightColor,
  scaffoldBackgroundColor: backgroundLightColor,
  accentColor: primaryColor,
  primaryColor: primaryColor,
  primaryColorLight: primaryLightColor,
  primaryColorDark: primaryDarkColor,
  focusColor: primaryColor,
  hintColor: primaryColor,
  cursorColor: primaryColor,
  errorColor: primaryDarkColor,
  appBarTheme: AppBarTheme(
    color: backgroundLightColor,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: primaryColor,
    ),
  ),
  iconTheme: IconThemeData(color: secondaryColor),
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: primaryDarkColor,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
  ),
  bottomAppBarTheme: BottomAppBarTheme(color: backgroundLightColor),
);
