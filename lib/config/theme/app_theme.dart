import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mova/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      displayLarge:
          GoogleFonts.urbanist(fontSize: 48, fontWeight: FontWeight.w700),
      displayMedium:
          GoogleFonts.urbanist(fontSize: 40, fontWeight: FontWeight.w700),
      displaySmall:
          GoogleFonts.urbanist(fontSize: 32, fontWeight: FontWeight.w700),
      headlineMedium:
          GoogleFonts.urbanist(fontSize: 24, fontWeight: FontWeight.w700),
      headlineSmall:
          GoogleFonts.urbanist(fontSize: 20, fontWeight: FontWeight.w700),
      titleLarge:
          GoogleFonts.urbanist(fontSize: 18, fontWeight: FontWeight.w700),
      bodyLarge:
          GoogleFonts.urbanist(fontSize: 16, fontWeight: FontWeight.w700),
      bodyMedium:
          GoogleFonts.urbanist(fontSize: 14, fontWeight: FontWeight.w700),
      bodySmall:
          GoogleFonts.urbanist(fontSize: 12, fontWeight: FontWeight.w700),
      labelSmall:
          GoogleFonts.urbanist(fontSize: 10, fontWeight: FontWeight.w700),
    ),
  );
}

class AppFontColorBuilder {
  static Color getGrey900AndWhite(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;

    return isLightMode ? AppColors.grey900 : AppColors.white;
  }

// static Color getGrey900AndWhite(BuildContext context) => Theme.of(context).brightness == ThemeMode.light ? AppColors.grey900 : AppColors.white;
// static Color getGrey900AndWhite(BuildContext context) => Theme.of(context).brightness == ThemeMode.light ? AppColors.grey900 : AppColors.white;
// static Color getGrey900AndWhite(BuildContext context) => Theme.of(context).brightness == ThemeMode.light ? AppColors.grey900 : AppColors.white;
// static Color getGrey900AndWhite(BuildContext context) => Theme.of(context).brightness == ThemeMode.light ? AppColors.grey900 : AppColors.white;
}
