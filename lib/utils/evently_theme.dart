import 'package:evently/utils/evently_colors.dart';
import 'package:evently/utils/evently_text_style.dart';
import 'package:flutter/material.dart';

class EventlyTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: EventlyColors.whiteBg,
    appBarTheme: AppBarThemeData(
      backgroundColor: EventlyColors.whiteBg,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: EventlyColors.mainBlue,
      selectionColor: EventlyColors.lightBlue.withAlpha(35),
      selectionHandleColor: EventlyColors.mainBlue
    ),
    textTheme: TextTheme(
      titleLarge: EventlyTextStyle.blackSemiBold20,
      titleMedium: EventlyTextStyle.greyW40016,
      titleSmall: EventlyTextStyle.mainBlueSemiBold14,
      bodyLarge: EventlyTextStyle.mainBlueSemiBold24,
      bodyMedium: EventlyTextStyle.whiteW50020,
      bodySmall: EventlyTextStyle.darkGreyW40014,
      labelMedium: EventlyTextStyle.mainBlueSemiBold18,
      labelSmall: EventlyTextStyle.whiteSemiBold14
    ),
    primaryColor: EventlyColors.mainBlue
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: EventlyColors.darkBlue,
      appBarTheme: AppBarThemeData(
          backgroundColor: EventlyColors.darkBlue
      ),
      textTheme: TextTheme(

      ),
      primaryColor: EventlyColors.white
  );
}