import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';
import '../widgets/top_rated_movies.dart';
import '../widgets/trending_movie.dart';
import '../widgets/trending_tv_show.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.043,
                ),
                const SearchBar(),
                const SizedBox(
                  height: 20,
                ),
                const TopRatedMovies(),
                const SizedBox(
                  height: 20,
                ),
                const TrendingMovies(),
                const SizedBox(
                  height: 20,
                ),
                const TrendingTvShow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
