import 'package:flutter/material.dart';
import 'package:mova/screens/home/widgets/movie_card_item.dart';
import 'package:mova/screens/home/widgets/movie_list.dart';
import 'package:mova/screens/home/widgets/movie_list_title.dart';
import 'package:mova/screens/home/widgets/top_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TopHeader(theme: theme),
          MovieListTitle(theme: theme, title: 'Top 10 Movies This Week'),
          MovieList(itemCount: 6, movieCategory: 'top_movies'),
          MovieListTitle(theme: theme, title: 'New Releases'),
          MovieList(itemCount: 6, movieCategory: 'new_movies'),
          const SliverPadding(padding: EdgeInsets.only(top: 24)),
        ],
      ),
    );
  }
}


