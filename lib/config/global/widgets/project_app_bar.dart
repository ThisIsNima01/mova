import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../theme_notifier.dart';
import '../../theme/app_theme.dart';
import '../constants/image_routes.dart';
class ProjectAppBar extends StatelessWidget {
  String appBarTitle;
  List<Widget>? actions;
   ProjectAppBar({
    super.key,
    required this.appBarTitle,
     this.actions,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text(
          appBarTitle,
          style: theme.textTheme.headlineMedium!
              .copyWith(color: AppDynamicColorBuilder.getGrey900AndWhite(context)),
        ),
      ),
      actions: actions,
      leading: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24),
        child: SvgPicture.asset(
          AppImagesRoute.appLogo,
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}


class SearchAppBarAction extends StatelessWidget {
  const SearchAppBarAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Padding(
        padding: const EdgeInsets.only(top: 24, right: 24),
        child: SvgPicture.asset(
          AppImagesRoute.iconSearch,
          color: AppDynamicColorBuilder.getGrey900AndWhite(context),
        ),
      ),
    );
  }
}