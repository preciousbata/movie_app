import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection.dart' as di;
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/screens/home_screen.dart';

import 'injection.dart';
import 'routes.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviezz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Mulish'),
      // home: MultiBlocProvider(providers: [
      //   BlocProvider(create: (_) => sl.get<TopRatedMovieBloc>()),
      //   BlocProvider(create: (_) => sl.get<TrendingMovieBloc>()),
      // ], child: const HomeScreen()),
      routes: routes,
      initialRoute: HomeScreen.routeName,
    );
  }
}
