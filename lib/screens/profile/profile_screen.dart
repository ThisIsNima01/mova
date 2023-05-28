import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';
import 'package:mova/config/global/widgets/project_app_bar.dart';
import 'package:mova/config/theme/app_colors.dart';
import 'package:mova/config/theme/app_gradients.dart';
import 'package:mova/config/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../../model_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer(builder: (context, ModelTheme themeNotifier, child) => Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 56),
        child: ProjectAppBar(
          appBarTitle: 'Profile',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      foregroundImage:
                      AssetImage(AppImagesRoute.userProfileImage),
                      radius: 60,
                    ),
                    Positioned(
                        child:
                        SvgPicture.asset(AppImagesRoute.iconEditProfile)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Nima Naderi',
                  style: theme.textTheme.headlineSmall!.copyWith(
                    color: AppDynamicColorBuilder.getGrey900AndWhite(context),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'nima.er.84@gmail.com',
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: AppDynamicColorBuilder.getGrey900AndWhite(context),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 24),
                Container(
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
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
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
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  // height: MediaQuery
                  //     .of(context)
                  //     .size
                  //     .height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) =>
                        ListTile(
                          title: Text(
                            getProfileOptionData()[index][0],
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
                            getProfileOptionData()[index][1],
                            color: AppDynamicColorBuilder.getGrey900AndWhite(
                                context),
                          ),
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}

List getProfileOptionData() =>
    [
      ['Edit Profile', AppImagesRoute.iconProfile],
      ['Notification', AppImagesRoute.iconBell],
      ['Download', AppImagesRoute.iconDownload],
      ['Security', AppImagesRoute.iconSecurity],
      ['Language', AppImagesRoute.iconLanguage],
      ['Dark Mode', AppImagesRoute.iconEye],
      ['Help Center', AppImagesRoute.iconHelp],
      ['Privacy policy', AppImagesRoute.iconPrivacy],
    ];
