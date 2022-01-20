import 'package:flutter/material.dart';

MaterialColor PrimaryMaterialColor = MaterialColor(
  4284790262,
  // ignore: prefer_const_literals_to_create_immutables
  <int, Color>{
    50: Color.fromRGBO(
      100,
      181,
      246,
      .1,
    ),
    100: Color.fromRGBO(
      100,
      181,
      246,
      .2,
    ),
    200: Color.fromRGBO(
      100,
      181,
      246,
      .3,
    ),
    300: Color.fromRGBO(
      100,
      181,
      246,
      .4,
    ),
    400: Color.fromRGBO(
      100,
      181,
      246,
      .5,
    ),
    500: Color.fromRGBO(
      100,
      181,
      246,
      .6,
    ),
    600: Color.fromRGBO(
      100,
      181,
      246,
      .7,
    ),
    700: Color.fromRGBO(
      100,
      181,
      246,
      .8,
    ),
    800: Color.fromRGBO(
      100,
      181,
      246,
      .9,
    ),
    900: Color.fromRGBO(
      100,
      181,
      246,
      1,
    ),
  },
);

ThemeData myTheme2 = ThemeData(
  fontFamily: "customFont",
  appBarTheme: AppBarTheme(centerTitle: true),
  primaryColor: Color(0xff64b5f6),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color(0xff64b5f6),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: PrimaryMaterialColor)
      .copyWith(secondary: Color(0xff64b5f6)),
);
