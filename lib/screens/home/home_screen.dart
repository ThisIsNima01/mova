import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mova/theme_notifier.dart';
import 'package:mova/screens/home/widgets/movie_list.dart';
import 'package:mova/screens/home/widgets/movie_list_title.dart';
import 'package:mova/screens/home/widgets/top_header.dart';
import 'package:provider/provider.dart';

import '../../movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier themeNotifier, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            const TopHeader(),
            MovieListTitle(title: 'Top 10 Movies This Week'),
            MovieList(itemCount: 6, movieCategory: 'top_movies'),
            MovieListTitle(title: 'New Releases'),
            MovieList(itemCount: 6, movieCategory: 'new_movies'),
            const SliverPadding(padding: EdgeInsets.only(top: 24)),
          ],
        ),
      ),
    );
  }
}
