import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';
import 'package:mova/config/global/widgets/project_app_bar.dart';
import 'package:mova/config/theme/app_theme.dart';
import 'package:mova/theme_notifier.dart';
import 'package:mova/screens/download/widgets/download_movie_item.dart';
import 'package:provider/provider.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
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
      ),
    );
  }
}




