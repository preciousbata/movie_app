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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 19),
                  child: Text(
                    'Moviezz',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SearchBar(),
                SizedBox(
                  height: 20,
                ),
                TopRatedMovies(),
                SizedBox(
                  height: 20,
                ),
                TrendingMovies(),
                SizedBox(
                  height: 20,
                ),
                TrendingTvShow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
