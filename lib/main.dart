import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection.dart' as di;
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_tv_show_bloc/trendingtv_show_bloc.dart';
import 'package:movie_app/src/presentation/screens/home_screen.dart';

import 'injection.dart';
import 'routes.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  TopRatedMovieBloc topRatedMovieBloc = sl.get<TopRatedMovieBloc>();
  TrendingMovieBloc trendingMovieBloc = sl.get<TrendingMovieBloc>();
  TrendingTvShowBloc trendingTvShowBloc = sl.get<TrendingTvShowBloc>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviezz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Mulish'),
      home: MultiBlocProvider(
          providers:[
            BlocProvider(create: (_) => topRatedMovieBloc),
            BlocProvider(create: (_) => trendingMovieBloc),
            BlocProvider(create: (_) => trendingTvShowBloc),
          ] ,
          child: const HomeScreen()),
      routes: routes,
    );
  }
}
