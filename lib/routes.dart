import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entity/arguments.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/presentation/screens/bookmark_screen.dart';
import 'package:movie_app/src/presentation/screens/bottom_nav.dart';
import 'package:movie_app/src/presentation/screens/home_screen.dart';
import 'package:movie_app/src/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/src/presentation/screens/view_all_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  BottomNav.routeName: (context) => const BottomNav(),
  MovieDetailScreen.routeName: (context) => MovieDetailScreen(
        screenArg: MovieDetailScreenArg(movie: MovieEntity.forTest()),
      ),
  ViewAllScreen.routeName: (context) => ViewAllScreen(
        arguments: ModalRoute.of(context)!.settings.arguments as Arguments,
      ),
  BookMarkScreen.routeName: (context) => const BookMarkScreen(),
};
