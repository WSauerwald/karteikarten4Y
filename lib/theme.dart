import 'package:flutter/material.dart';

class AppTheme {
  //### Light ###
  static const Color _lightScaffoldColor =
      Color.fromARGB(255, 26, 200, 168); // Scaffold Background
  static const Color _lightAppBarColor =
      Color.fromARGB(255, 119, 216, 199); // AppBar
  static const Color _lightPrimaryColor =
      Color.fromARGB(255, 119, 216, 199); // Container
  static const Color _lightPrimaryVariantColor =
      Color.fromARGB(255, 110, 234, 211); //
  static const Color _lightOnPrimaryColor =
      Color.fromARGB(255, 0, 0, 0); // Schrift
  static const Color _lightSecondaryVariantColor =
      Color.fromARGB(255, 255, 34, 4); // Test

  static const Color _lightIconColor = Colors.black;
  static const Color _lightTextColor = Colors.black;

  static const TextStyle _lightAppBarText =
      TextStyle(color: _lightTextColor, fontSize: 25);
  static const TextStyle _lightHeadingText =
      TextStyle(color: _lightTextColor, fontSize: 20);
  static const TextStyle _lightBodyText =
      TextStyle(color: _lightTextColor, fontSize: 15);

  static const TextTheme _lightTextTheme =
      TextTheme(displayLarge: _lightHeadingText, bodyLarge: _lightBodyText);
  //### ###

  //Light Mode
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightScaffoldColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: _lightAppBarText,
      color: _lightAppBarColor,
      iconTheme: IconThemeData(color: _lightIconColor),
    ),
    colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
        onPrimaryContainer: _lightPrimaryVariantColor,
        onSecondaryContainer: _lightSecondaryVariantColor),
    textTheme: _lightTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: _lightAppBarColor),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle:
                MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 15)))),
  );

  //### dark ###

  static const IconThemeData _iconThemeData =
      IconThemeData(size: 30, color: Colors.white);

  static const AppBarTheme _appBarTheme = AppBarTheme(
      centerTitle: true,
      color: Color.fromARGB(255, 46, 55, 60),
      iconTheme: _iconThemeData,
      actionsIconTheme: _iconThemeData,
      titleTextStyle: TextStyle(fontSize: 25, letterSpacing: 1.5));

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    counterStyle: TextStyle(color: Colors.white.withOpacity(.8)),
    errorStyle: const TextStyle(color: Color.fromARGB(255, 252, 18, 1)),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    labelStyle: TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
  );

  // static const ColorScheme _colorScheme = ColorScheme(
  //   brightness: brightness,
  //   primary: primary,
  //   onPrimary: onPrimary,
  //   secondary: secondary,
  //   onSecondary: onSecondary,
  //   error: error,
  //   onError: onError,
  //   background: background,
  //   onBackground: onBackground,
  //   surface: surface,
  //   onSurface: onSurface
  // );

  //### ###

  //Dark Mode
  static ThemeData darkTheme = ThemeData(
    //colorScheme: ,
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: const Color(0xff192028),
    inputDecorationTheme: _inputDecorationTheme,
  );
}
