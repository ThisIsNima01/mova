import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';
import 'package:mova/config/global/widgets/project_app_bar.dart';
import 'package:mova/config/theme/app_theme.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 56),
        child: ProjectAppBar(
            appBarTitle: 'Download', actions: const [SearchAppBarAction()]),
      ),
      body: SafeArea(
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => DownloadMovieItem(index: index),
          ),
        ),
      ),
    );
  }
}

class DownloadMovieItem extends StatelessWidget {
  int index;

  DownloadMovieItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      margin: EdgeInsets.only(
          top: index == 0 ? 32.h : 16.h, bottom: index == 5 ? 32.h : 0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/downloads/${index}.png', width: 150.w),
              SvgPicture.asset(AppImagesRoute.iconPlay, height: 20, width: 20),
            ],
          ),
          Expanded(
            child: Container(
              padding:  EdgeInsets.only(left: 20.w),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getDownloadMoviesName()[index],
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: AppFontColorBuilder.getGrey900AndWhite(context),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '1h 42m 33s',
                    style: theme.textTheme.bodyMedium!.copyWith(
                        color:
                            AppFontColorBuilder.getGrey800AndGrey300(context),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: theme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        child: Text(
                          '1.4GB',
                          style: theme.textTheme.labelSmall!.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppImagesRoute.iconTrash),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> getDownloadMoviesName() => [
      'Lightyear',
      'Top Gun: Maverick',
      'Thor: Love & Thunder',
      'Stranger Things 4: Epi...',
      'Avatar: The Way of Wa...',
      'Doctor Strange in the ...',
    ];
