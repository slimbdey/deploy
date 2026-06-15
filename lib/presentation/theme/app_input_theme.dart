import 'package:flutter/material.dart';

class AppInputTheme {
  static InputDecorationTheme build({
    required Color accentColor,
    required Color inactiveColor,
    required Color surfaceColor,
    required Color mainColor,
    required Color errorColor,
  }) =>
      InputDecorationTheme(
        border: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: mainColor, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: mainColor, width: 3),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor, width: 3),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        helperStyle: TextStyle(fontSize: 10, height: 1, color: mainColor),
        labelStyle: TextStyle(color: mainColor, fontSize: 10),
        errorStyle: TextStyle(
          color: errorColor,
          fontSize: 10,
          letterSpacing: 0,
          height: 1,
        ),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          return TextStyle(
            color: states.contains(WidgetState.error) ? errorColor : mainColor,
            fontSize: 14,
            inherit: false,
            height: 2,
          );
        }),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: surfaceColor,
      );
}
