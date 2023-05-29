import 'package:flutter/material.dart';
import 'package:mova/theme_notifier.dart';
import 'package:mova/screens/explore/widgets/movie_filters.dart';
import 'package:mova/screens/explore/widgets/search_and_filter.dart';
import 'package:provider/provider.dart';

import '../../config/global/widgets/movies_grid.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SearchAndFilter(),
              SliverToBoxAdapter(
                child: MovieFilters(),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                sliver: MoviesGrid(
                  childCount: 6,
                  movieCategory: 'new_movies',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
