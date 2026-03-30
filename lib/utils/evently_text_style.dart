import 'package:flutter/material.dart';
import 'package:evently/utils/evently_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class EventlyTextStyle {
  static TextStyle mainBlueSemiBold14 = GoogleFonts.poppins(
      fontSize: 14,
      color: EventlyColors.mainBlue,
      fontWeight: FontWeight.w600
  );
  static TextStyle mainBlueSemiBold24 = GoogleFonts.poppins(
      fontSize: 24,
      color: EventlyColors.mainBlue,
      fontWeight: FontWeight.w600
  );
  static TextStyle whiteW50020 = GoogleFonts.poppins(
      fontSize: 20,
      color: EventlyColors.white,
      fontWeight: FontWeight.w500
  );
  static TextStyle blackSemiBold20 = GoogleFonts.poppins(
    fontSize: 20,
    color: EventlyColors.black,
    fontWeight: FontWeight.w600
  );
  static TextStyle greyW40016 = GoogleFonts.poppins(
      fontSize: 16,
      color: EventlyColors.grey,
      fontWeight: FontWeight.w400
  );
}