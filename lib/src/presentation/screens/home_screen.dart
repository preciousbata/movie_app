import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/widgets/home_screen_banner.dart';

import '../widgets/top_rated_movies.dart';
import '../widgets/trending_movie.dart';
import '../widgets/trending_tv_show.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5),
          child: Container(
            height: 30,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.white60, shape: BoxShape.circle),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Container(
                height: 40,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.white60, shape: BoxShape.circle),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          )
        ],
      ),
      backgroundColor: Colors.black.withOpacity(0.95),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenBanner(),
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
            TrendingTvShow(),
          ],
        ),
      ),
    );
  }
}
