import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme textTheme({
    required Color mainColor,
    required Color accentColor,
    required Color inactiveColor,
  }) {
    return TextTheme(
      headlineLarge: TextStyle(
        color: mainColor,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 23 / 20,
      ),
      titleLarge: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 22,
        letterSpacing: 0,
        height: 1,
      ),
      titleMedium: TextStyle(
        color: mainColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: accentColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        color: inactiveColor,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1,
      ),
      labelMedium: TextStyle(
        color: inactiveColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1,
      ),
      bodySmall: const TextStyle(color: Colors.black, fontSize: 12),
      bodyMedium: TextStyle(
        color: mainColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
        height: 2,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.2,
      ),
    );
  }

  static TextSelectionThemeData textSelectionTheme() =>
      const TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Color.fromRGBO(0, 0, 0, 0.1),
        selectionHandleColor: Colors.black,
      );
}
