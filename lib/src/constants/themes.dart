import 'package:flutter/material.dart';
import 'package:work_anywhere_flutter/src/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColorDark: kPrimaryColorDark,
  primaryColor: kPrimaryColor,
  backgroundColor: Colors.white30,
  textTheme: TextTheme(
    headline1: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21.0),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 13,
    ),
    subtitle1: TextStyle(
      color: Colors.grey,
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
    )
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColorDark: Colors.black,
  primaryColor: kPrimaryColorDarkTheme,
  backgroundColor: Colors.white30,
  textTheme: TextTheme(
    headline1: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21.0),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 13,
    ),
    subtitle1: TextStyle(
      color: Colors.grey,
      fontSize: 10.0,
      fontWeight: FontWeight.bold,
    )
  ),
);

