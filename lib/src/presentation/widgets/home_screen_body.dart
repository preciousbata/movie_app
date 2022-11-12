import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/widgets/top_rated_movies.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending.dart';

import 'home_screen_search_bar.dart';
import 'movie_category.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() =>
      _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SearchBar(),
            SizedBox(
              height: 12,
            ),
            MovieCategories(),
            SizedBox(
              height: 12,
            ),
            TopRatedMovies(),
            SizedBox(
              height: 12,
            ),
            TrendingMovies()
          ],
        ),
      ),
    );
  }
}
