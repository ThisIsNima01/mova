import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/config/theme/app_theme.dart';
import 'package:mova/screens/base/base_screen.dart';
import 'package:mova/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     builder: (context) => const MyApp(),
  //     enabled: !kReleaseMode,
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightMode,
        // builder: DevicePreview.appBuilder,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.system,
        home: const BaseScreen(),
      ),
    );
  }
}
