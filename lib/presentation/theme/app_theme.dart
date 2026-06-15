import 'package:flutter/material.dart';
import 'package:hw/presentation/theme/app_bar_theme.dart';
import 'package:hw/presentation/theme/app_button_theme.dart';
import 'package:hw/presentation/theme/app_card_theme.dart';
import 'package:hw/presentation/theme/app_dialog_theme.dart';
import 'package:hw/presentation/theme/app_input_theme.dart';

import 'app_text_theme.dart';

class AppTheme {
  static ThemeData light() {
    const Color mainColor = Color.fromRGBO(22, 89, 50, 1);
    const Color accentColor = Color.fromRGBO(46, 204, 113, 1);
    final Color surfaceColor = Color.fromRGBO(236, 236, 236, 1);
    const Color inactiveColor = Color.fromRGBO(194, 194, 194, 1);
    final Color errorColor = Color.fromRGBO(245, 72, 72, 1);

    final Color secondaryText = Color.fromRGBO(121, 118, 118, 1);
    final Color tertiaryText = Color.fromRGBO(45, 73, 12, 1);

    const buttonTheme = AppButtonTheme(
      accentColor: accentColor,
      inactiveColor: inactiveColor,
      mainColor: mainColor,
    );

    return ThemeData(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black).copyWith(
        primary: Colors.white,
        onPrimary: Colors.black,
        onPrimaryFixed: mainColor,
        onPrimaryContainer: inactiveColor,
        onPrimaryFixedVariant: accentColor,
        secondary: surfaceColor,
        onSecondary: secondaryText,
        onSecondaryFixed: secondaryText,
        onSecondaryFixedVariant: surfaceColor,
        tertiary: Color.fromRGBO(46, 204, 113, 0.4),
        onTertiary: tertiaryText,
        onTertiaryFixed: mainColor,
        onTertiaryFixedVariant: accentColor,
        error: errorColor,
        onError: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
        onSurfaceVariant: accentColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarCustom.appBar(),
      bottomAppBarTheme: AppBarCustom.bottomAppBar(),
      cardTheme: AppCardTheme.build(),
      filledButtonTheme: buttonTheme.filled(),
      outlinedButtonTheme: buttonTheme.outlined(),
      floatingActionButtonTheme: buttonTheme.floating(),
      dialogTheme: AppDialogTheme.build(),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 0,
        color: surfaceColor,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.black),
      inputDecorationTheme: AppInputTheme.build(
        accentColor: accentColor,
        inactiveColor: inactiveColor,
        surfaceColor: surfaceColor,
        mainColor: mainColor,
        errorColor: errorColor,
      ),
      textTheme: AppTextTheme.textTheme(
        mainColor: mainColor,
        accentColor: accentColor,
        inactiveColor: inactiveColor,
      ),
      textSelectionTheme: AppTextTheme.textSelectionTheme(),
    );
  }
}
