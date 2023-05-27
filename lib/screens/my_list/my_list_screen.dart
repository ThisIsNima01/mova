import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';
import 'package:mova/config/theme/app_theme.dart';

import '../../config/global/widgets/project_app_bar.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    ThemeData theme = Theme.of(context);
    return Scaffold(
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
            brightness == Brightness.light
                ? AppImagesRoute.emptyListLight
                : AppImagesRoute.emptyListDark,
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
                color: AppFontColorBuilder.getGrey800AndWhite(context),
                fontWeight: FontWeight.w500,
                height: 1.5),
          ),
        ],
      )),
    );
  }
}
