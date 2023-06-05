import 'package:flutter/material.dart';

import '../../../config/global/widgets/movie_card_item.dart';

class MovieList extends StatelessWidget {
  int itemCount;
  String movieCategory;

  MovieList({
    super.key,
    required this.itemCount,
    required this.movieCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MovieCardItem(itemIndex: index, itemCount: itemCount, movieCategory: movieCategory,needsSpacing: true),
        ),
      ),
    );
  }
}
