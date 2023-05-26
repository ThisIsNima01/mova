import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/app_colors.dart';
import '../explore_screen.dart';
class MovieFilters extends StatelessWidget {
  const MovieFilters({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
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
              getMoviesFilter()[index],
              style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}