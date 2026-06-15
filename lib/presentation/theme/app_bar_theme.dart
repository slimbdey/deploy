import 'package:flutter/material.dart';

class AppBarCustom {
  static AppBarThemeData appBar() => AppBarThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 5,
      );

  static BottomAppBarThemeData bottomAppBar() => BottomAppBarThemeData(
        color: Colors.white,
        height: 60,
        padding: EdgeInsets.all(0),
      );
}
