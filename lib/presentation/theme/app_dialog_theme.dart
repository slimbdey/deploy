import 'package:flutter/material.dart';

class AppDialogTheme {
  static DialogThemeData build() => DialogThemeData(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide.none,
        ),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );
}
