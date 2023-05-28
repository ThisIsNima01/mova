import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/app_theme.dart';
class MovieListTitle extends StatelessWidget {
  String title;
  MovieListTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverPadding(
      padding:  EdgeInsets.all(24.w),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              title,
              style: theme.textTheme.headlineSmall!.copyWith(
                  color: AppDynamicColorBuilder.getGrey900AndWhite(context)),
            ),
            const Spacer(),
            Text(
              'See all',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}