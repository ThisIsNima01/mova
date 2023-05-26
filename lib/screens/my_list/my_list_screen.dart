import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';
import 'package:mova/config/theme/app_colors.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'My List',
          style: TextStyle(color: Colors.red),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 24,left: 24),
          child: Column(children: [
            SvgPicture.asset(
              AppImagesRoute.appLogo,
              height: 32.h,
              width: 32.w,
            )
          ]),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text('f'),
        ],
      )),
    );
  }
}
