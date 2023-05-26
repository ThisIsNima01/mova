import 'package:flutter/material.dart';
import 'package:mova/screens/explore/widgets/movie_filters.dart';
import 'package:mova/screens/explore/widgets/search_and_filter.dart';

import '../../config/global/widgets/movies_grid.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SearchAndFilter(theme: theme),
            MovieFilters(theme: theme),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              sliver: MoviesGrid(
                childCount: 6,
                movieCategory: 'new_movies',
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> getMoviesFilter() => ['Movie','US','Action','2022','Latest Release'];
