import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.grey[900]!),
  colorScheme: ColorScheme.light(
    background: Colors.grey[100]!,
    onBackground: Colors.grey[800]!,
    primary: Colors.grey[200]!,
    onPrimary: Colors.grey[500]!,
    secondary: Colors.grey[300]!,
    inversePrimary: Colors.grey[600]!,
    primaryContainer: const Color.fromARGB(255, 198, 204, 230),
  ),
);
