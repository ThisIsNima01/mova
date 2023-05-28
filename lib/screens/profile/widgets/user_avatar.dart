import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/global/constants/image_routes.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}