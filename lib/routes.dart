import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/screens/home_screen.dart';
import 'package:movie_app/src/presentation/screens/movie_detail_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  MovieDetailScreen.routeName : (context) => const MovieDetailScreen(),

};