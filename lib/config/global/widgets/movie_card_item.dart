import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova/config/global/utils/random_movie_point.dart';
import '../../theme/app_colors.dart';

class MovieCardItem extends StatelessWidget {
 final int itemIndex;
 final int itemCount;
 final String movieCategory;
 final bool needsSpacing;

  const MovieCardItem({
    Key? key,
    required this.itemIndex,
    required this.itemCount,
    required this.movieCategory,
    required this.needsSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: 150.w,
      margin: needsSpacing
          ? EdgeInsets.only(
              left: itemIndex == 0 ? 24.w : 10.w,
              right: itemIndex == itemCount - 1 ? 24.w : 0)
          : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/$movieCategory/$itemIndex.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(6)),
          child: Text(
            getRandomMoviePoint(minPoint: 7, maxPoint: 10),
            style: theme.textTheme.labelSmall!
                .copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
