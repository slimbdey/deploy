import 'package:flutter/material.dart';

class AppButtonTheme {
  final Color accentColor;
  final Color inactiveColor;
  final Color mainColor;

  const AppButtonTheme({
    required this.accentColor,
    required this.inactiveColor,
    required this.mainColor,
  });

  FilledButtonThemeData filled() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: inactiveColor,
        fixedSize: const Size(232, 48),
        textStyle: const TextStyle(
          fontSize: 16,
          inherit: false,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  OutlinedButtonThemeData outlined() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: mainColor, width: 3),
        foregroundColor: mainColor,
        fixedSize: const Size(232, 48),
        textStyle: const TextStyle(
          fontSize: 16,
          inherit: false,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  FloatingActionButtonThemeData floating() {
    return FloatingActionButtonThemeData(
      backgroundColor: accentColor,
      iconSize: 22,
      foregroundColor: Colors.white,
      shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
    );
  }
}
