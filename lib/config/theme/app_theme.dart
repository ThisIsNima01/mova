import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mova/config/theme/app_colors.dart';

class AppTheme {
  static TextTheme appTextTheme = TextTheme(
    displayLarge:
        GoogleFonts.urbanist(fontSize: 48.sp, fontWeight: FontWeight.w700),
    displayMedium:
        GoogleFonts.urbanist(fontSize: 40.sp, fontWeight: FontWeight.w700),
    displaySmall:
        GoogleFonts.urbanist(fontSize: 32.sp, fontWeight: FontWeight.w700),
    headlineMedium:
        GoogleFonts.urbanist(fontSize: 24.sp, fontWeight: FontWeight.w700),
    headlineSmall:
        GoogleFonts.urbanist(fontSize: 20.sp, fontWeight: FontWeight.w700),
    titleLarge:
        GoogleFonts.urbanist(fontSize: 18.sp, fontWeight: FontWeight.w700),
    bodyLarge:
        GoogleFonts.urbanist(fontSize: 16.sp, fontWeight: FontWeight.w700),
    bodyMedium:
        GoogleFonts.urbanist(fontSize: 14.sp, fontWeight: FontWeight.w700),
    bodySmall:
        GoogleFonts.urbanist(fontSize: 12.sp, fontWeight: FontWeight.w700),
    labelSmall:
        GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w700),
  );

  static ThemeData lightMode = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.white,
        unselectedLabelStyle:
            GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w500),
        selectedLabelStyle: GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w700),
      ),
      scaffoldBackgroundColor: AppColors.white,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      textTheme: appTextTheme);

  static ThemeData darkMode = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.dark1),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedLabelStyle:
        GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w500),
        selectedLabelStyle: GoogleFonts.urbanist(fontSize: 10.sp, fontWeight: FontWeight.w700),
        elevation: 0,
        backgroundColor: const Color(0xff181A20).withOpacity(0.8),
      ),
      scaffoldBackgroundColor: AppColors.dark1,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      textTheme: appTextTheme);
}

class AppDynamicColorBuilder {
  static bool? isDarkMode;
  static Color getGrey900AndWhite(BuildContext context) {
    return isDarkMode ?? true
        ? AppColors.white
            : AppColors.grey900;
  }

  static Color getGrey800AndWhite(BuildContext context) {

    return isDarkMode ?? true
        ? AppColors.white
        : AppColors.grey800;
  }
  static Color getGrey800AndGrey300(BuildContext context) {
    return isDarkMode ?? true
        ? AppColors.grey300
        : AppColors.grey800;
  }

  static Color getGrey700AndGrey300(BuildContext context) {

    return isDarkMode ?? true
        ? AppColors.grey300
        : AppColors.grey700;
  }

  static Color getGrey100AndDark2(BuildContext context) {

    return isDarkMode ?? true
        ? AppColors.dark2
        : AppColors.grey100;
  }

  static Color getGrey600AndGrey400(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    // bool isDarkMode = brightness == Brightness.dark;

    return isDarkMode ?? true
        ? AppColors.grey600
        : AppColors.grey400;
  }
  static Color getWhiteAndDark2(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    // bool isDarkMode = brightness == Brightness.dark;

    return isDarkMode ?? true
        ? AppColors.dark2
        : AppColors.white;
  }

  static Color getPrimary100AndDark3(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    // bool isDarkMode = brightness == Brightness.dark;

    return isDarkMode ?? true
        ? AppColors.dark3
        : AppColors.primary.withOpacity(0.2);
  }

  static Color getPrimaryAndWhite(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    // bool isDarkMode = brightness == Brightness.dark;

    return isDarkMode ?? true
        ? AppColors.white
        : AppColors.primary;
  }

  static Color getDark3AndGrey200(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    // bool isDarkMode = brightness == Brightness.dark;

    return isDarkMode ?? true
        ? AppColors.dark3
        : AppColors.grey200;
  }

}
