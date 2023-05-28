import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/global/constants/image_routes.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_gradients.dart';
import '../../../config/theme/app_theme.dart';
import '../../../theme_notifier.dart';
class PremiumCard extends StatelessWidget {
  ThemeNotifier themeNotifier;
  PremiumCard({
    super.key,
    required this.themeNotifier
  });


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      // height: 200,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: AppGradients.redGradient,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: themeNotifier.isDark
              ? theme.scaffoldBackgroundColor
              : AppColors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppImagesRoute.iconPremium),
            SizedBox(
              width: 20.w,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Join Premium!',
                      style: theme.textTheme.headlineMedium!
                          .copyWith(color: theme.primaryColor),
                      textAlign: TextAlign.left),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Enjoy watching Full-HD movies, \nwithout restrictions and without ads',
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: AppDynamicColorBuilder
                          .getGrey700AndGrey300(context),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SvgPicture.asset(AppImagesRoute.iconArrowRight),
          ],
        ),
      ),
    );
  }
}