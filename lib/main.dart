import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/config/theme/app_theme.dart';
import 'package:mova/theme_notifier.dart';
import 'package:mova/screens/base/base_screen.dart';
import 'package:provider/provider.dart';

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
      useInheritedMediaQuery: true,
      designSize: const Size(428, 926),
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier themeNotifier, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                themeNotifier.isDark ? AppTheme.darkMode : AppTheme.lightMode,
            home: const BaseScreen(),
          ),
        ),
      ),
    );
  }
}
