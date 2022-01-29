import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
    splashColor: Colors.pinkAccent,

    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.pink,
    ).copyWith(
      secondary: Colors.pinkAccent,
    ),

  textTheme: const TextTheme(
    headline2: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white70),
    headline4: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal, color: Colors.white60),
    headline6: TextStyle(fontSize: 20.0, color: Colors.white60),
    bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind', color: Colors.white70),
  ),

);