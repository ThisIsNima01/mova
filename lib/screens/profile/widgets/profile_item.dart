import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova/config/global/constants/app_static_data.dart';

import '../../../config/global/constants/image_routes.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_theme.dart';
import '../../../theme_notifier.dart';
class ProfileOptionItem extends StatelessWidget {
  int index;
  ThemeNotifier themeNotifier;
  ProfileOptionItem({
    super.key,
    required this.index,
    required this.themeNotifier,
  });


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      title: Text(
        AppStaticData.profileOptionsData[index][0],
        style: theme.textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppDynamicColorBuilder.getGrey900AndWhite(
              context),
        ),
      ),
      minLeadingWidth: 20,
      contentPadding: const EdgeInsets.all(0),
      visualDensity: VisualDensity(vertical: -2.w),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index == 4)
            Text(
              'English (US)',
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color:
                AppDynamicColorBuilder.getGrey900AndWhite(
                    context),
              ),
            ),
          if (index == 5)
            Switch(
              activeColor: AppColors.white,
              inactiveThumbColor: theme.primaryColor,
              activeTrackColor: theme.primaryColor,
              value: themeNotifier.isDark,
              onChanged: (value) {
                themeNotifier.isDark
                    ? themeNotifier.isDark = false
                    : themeNotifier.isDark = true;
              },
            ),

          if (index != 5) ...[
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              AppImagesRoute.iconArrowRight,
              color: AppDynamicColorBuilder
                  .getGrey900AndWhite(
                  context),
            ),
          ],
        ],
      ),
      leading: SvgPicture.asset(
        AppStaticData.profileOptionsData[index][1],
        color: AppDynamicColorBuilder.getGrey900AndWhite(
            context),
      ),
    );
  }
}