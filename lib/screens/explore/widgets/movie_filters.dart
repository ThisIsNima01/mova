import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/config/global/constants/app_static_data.dart';

import '../../../config/theme/app_colors.dart';
class MovieFilters extends StatelessWidget {
  const MovieFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            margin: EdgeInsets.only(
                right: index == 4 ? 24 : 0, left: index == 0 ? 24 : 12),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              AppStaticData.moviesFilter[index],
              style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}