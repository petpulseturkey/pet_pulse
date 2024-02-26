import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.grey[100]!),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    onBackground: Colors.grey[100]!,
    primary: Colors.grey[900]!,
    onPrimary: Colors.grey[500]!,
    secondary: Colors.grey[800]!,
    inversePrimary: Colors.grey[300]!,
    primaryContainer: const Color.fromARGB(255, 58, 72, 135),
  ),
);
