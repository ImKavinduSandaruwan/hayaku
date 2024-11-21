import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hayaku_app/config/colors.dart';

class ThemeDataStyle {
  /// Light theme data
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: GoogleFonts.quicksandTextTheme(),
    scaffoldBackgroundColor: Colors.white,
  );

  /// Dark theme data
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.quicksandTextTheme(),
    scaffoldBackgroundColor: AppColors.primaryAsset,
    bottomSheetTheme:  BottomSheetThemeData(
        modalBackgroundColor: AppColors.primaryLight,
        backgroundColor: Colors.transparent),
  );
}
