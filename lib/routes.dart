import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/presentation/screens/home_screen.dart';
import 'package:movie_app/src/presentation/screens/movie_detail_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  MovieDetailScreen.routeName : (context) =>  MovieDetailScreen(movie: ModalRoute.of(context)!.settings.arguments as MovieEntity,),

};