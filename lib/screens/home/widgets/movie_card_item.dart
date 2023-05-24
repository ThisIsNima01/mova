import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';
class MovieCardItem extends StatelessWidget {
  int itemIndex;

  MovieCardItem({Key? key, required this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 200,
      width: 150,
      margin: EdgeInsets.only(left: itemIndex == 0 ? 24 : 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/movie_item_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(6)),
          child: Text(
            '9.8',
            style: theme.textTheme.labelSmall!
                .copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
