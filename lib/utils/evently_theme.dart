import 'package:evently/utils/evently_colors.dart';
import 'package:flutter/material.dart';

class EventlyTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: EventlyColors.whiteBg,
    appBarTheme: AppBarThemeData(
      backgroundColor: EventlyColors.whiteBg
    )
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: EventlyColors.darkBlue,
      appBarTheme: AppBarThemeData(
          backgroundColor: EventlyColors.darkBlue
      )
  );
}