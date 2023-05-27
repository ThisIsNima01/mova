import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_animated_theme/animation_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/config/theme/app_theme.dart';
import 'package:mova/model_theme.dart';
import 'package:mova/my_theme_preference.dart';
import 'package:mova/screens/base/base_screen.dart';
import 'package:mova/screens/home/home_screen.dart';
import 'package:mova/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
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
        create: (context) => ModelTheme(),
        child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: AppTheme.lightMode,
            // builder: DevicePreview.appBuilder,
            // darkTheme: AppTheme.darkMode,
            theme:
                themeNotifier.isDark ? AppTheme.darkMode : AppTheme.lightMode,
            home: const BaseScreen(),
          ),
        ),
      ),
    );
  }
}
