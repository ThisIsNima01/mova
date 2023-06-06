import 'package:flutter/material.dart';

import '../../../config/global/constants/app_static_data.dart';
import 'filter_title.dart';
import 'movie_filters.dart';

class ExploreModalItem extends StatelessWidget {
  final int index;

  const ExploreModalItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterTitle(title: AppStaticData.exploreModalTitles[index]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: MovieFilters(selectedIndex: 3),
        ),
      ],
    );
  }
}
