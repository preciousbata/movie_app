import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection.dart' as di;
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviezz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Mulish'),
      home: BlocProvider(
          create: (_) => topRatedMovieBloc,
          child: const HomeScreen()),
      routes: routes,
    );
  }
}
