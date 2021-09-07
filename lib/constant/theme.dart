import 'package:flutter/material.dart';

class ThemeColor {
  static ThemeData themeData(bool isDarkMode) {
    return ThemeData(
    scaffoldBackgroundColor: isDarkMode ? Color(0xFF6B6767) : Colors.white,
    primarySwatch: Colors.blue,
    primaryColor: Color(0xFF0070FF),
    accentColor: Color(0xff0070FF),
    backgroundColor: isDarkMode ? Colors.black : Colors.white,
    indicatorColor: Color(0xFF0070FF),
    buttonColor: Color(0xFF0070FF),
    hintColor: Color(0xFF6B6767),
    highlightColor: Color(0xFF0070FF),
    hoverColor: Color(0xFFE5E5E5),
    focusColor: Color(0xffE5E5E5),
    disabledColor: Colors.grey,
    canvasColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      elevation: 0.1,
    ),
    textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.black),
  );
  }
}
