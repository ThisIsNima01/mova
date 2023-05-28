import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';
import 'package:mova/config/theme/app_theme.dart';
import 'package:mova/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../config/global/widgets/project_app_bar.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 56),
          child: ProjectAppBar(
            appBarTitle: 'My List',
            actions: const [
              SearchAppBarAction(),
            ],
          ),
        ),
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                Image.asset(
                  themeNotifier.isDark
                      ? AppImagesRoute.emptyListDark
                      : AppImagesRoute.emptyListLight,
                  height: 220.h,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 44),
                Text('Your List is Empty',
                    style: theme.textTheme.headlineMedium!
                        .copyWith(color: theme.primaryColor)),
                const SizedBox(height: 16),
                Text(
                  'It seems that you haven\'t added\n any movies to the list',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge!.copyWith(
                      color: AppDynamicColorBuilder.getGrey800AndWhite(context),
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                ),
              ],
            )),
      ),
    );
  }
}
