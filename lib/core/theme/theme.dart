import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Pallete.primaryLightColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Pallete.borderColor,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Pallete.focusedBorderColor,
          width: 2.0,
        ),
      )
    )
  );
}