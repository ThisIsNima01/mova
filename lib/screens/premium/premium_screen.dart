import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova/config/global/constants/app_static_data.dart';
import 'package:mova/config/theme/app_theme.dart';

import '../../config/global/constants/image_routes.dart';
import '../../config/theme/app_gradients.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                'Subscribe to Premium',
                style: theme.textTheme.displaySmall!
                    .copyWith(color: theme.primaryColor),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Enjoy watching Full-HD movies, without \nrestrictions and without ads',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: AppDynamicColorBuilder.getGrey800AndWhite(context),
                    fontWeight: FontWeight.w500,
                    height: 1.3),
              ),
              SizedBox(
                height: 24.h,
              ),
              const PremiumItemCard(
                subscriptionPrice: '9.99',
                subscriptionTime: 'month',
              ),
              SizedBox(
                height: 24.h,
              ),
              const PremiumItemCard(
                subscriptionPrice: '99.99',
                subscriptionTime: 'year',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumItemCard extends StatelessWidget {
  final String subscriptionPrice;
  final String subscriptionTime;

  const PremiumItemCard(
      {Key? key,
      required this.subscriptionPrice,
      required this.subscriptionTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: AppGradients.redGradient,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: double.infinity,
        padding:  EdgeInsets.all(24.h),
        decoration: BoxDecoration(
          color: AppDynamicColorBuilder.getDark2AndGrey50(context),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            SvgPicture.asset(AppImagesRoute.iconPremium),
            SizedBox(
              height: 16.h,
            ),
            RichText(
              text: TextSpan(
                text: '\$$subscriptionPrice',
                style: theme.textTheme.displaySmall!.copyWith(
                  color: AppDynamicColorBuilder.getGrey900AndWhite(context),
                ),
                children: [
                  const WidgetSpan(
                    child: SizedBox(
                      width: 8,
                    ),
                  ),
                  TextSpan(
                    text: '/$subscriptionTime',
                    style: theme.textTheme.titleLarge!.copyWith(
                      color:
                          AppDynamicColorBuilder.getGrey700AndGrey300(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              color: AppDynamicColorBuilder.getDark3AndGrey200(context),
              thickness: 1,
              height: 1,
            ),
            SizedBox(
              height: 16.h,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: AppStaticData.subscriptionCardFeaturesTitle.length,
              itemBuilder: (context, index) => Row(
                children: [
                  SvgPicture.asset(AppImagesRoute.iconDone),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    AppStaticData.subscriptionCardFeaturesTitle[index],
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color:
                          AppDynamicColorBuilder.getGrey800AndGrey300(context),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
