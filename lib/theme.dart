import 'package:flutter/material.dart';

MaterialColor PrimaryMaterialColor = MaterialColor(
  4289520631,
  // ignore: prefer_const_literals_to_create_immutables
  <int, Color>{
    50: Color.fromRGBO(
      172,
      227,
      247,
      .1,
    ),
    100: Color.fromRGBO(
      172,
      227,
      247,
      .2,
    ),
    200: Color.fromRGBO(
      172,
      227,
      247,
      .3,
    ),
    300: Color.fromRGBO(
      172,
      227,
      247,
      .4,
    ),
    400: Color.fromRGBO(
      172,
      227,
      247,
      .5,
    ),
    500: Color.fromRGBO(
      172,
      227,
      247,
      .6,
    ),
    600: Color.fromRGBO(
      172,
      227,
      247,
      .7,
    ),
    700: Color.fromRGBO(
      172,
      227,
      247,
      .8,
    ),
    800: Color.fromRGBO(
      172,
      227,
      247,
      .9,
    ),
    900: Color.fromRGBO(
      172,
      227,
      247,
      1,
    ),
  },
);

ThemeData myTheme = ThemeData(
  //buttonTheme:ButtonThemeData(co) ,

  fontFamily: "customFont",
  primaryColor: Color(0xfface3f7),
  appBarTheme: AppBarTheme(centerTitle: true),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color(0xfface3f7),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: PrimaryMaterialColor)
      .copyWith(secondary: Color(0xfface3f7)),
  cardTheme: CardTheme(elevation: 8),
);
