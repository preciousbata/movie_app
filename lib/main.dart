import 'package:flutter/material.dart';
import 'package:movie_app/injection.dart' as di;
import 'package:movie_app/src/core/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/data/data_source/get_movie_remote_data_source.dart';
import 'package:movie_app/src/data/repositories/get_movie_repo_impl.dart';
import 'package:movie_app/src/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/src/domain/usecases/get_trending_movie_usecase.dart';
import 'package:movie_app/src/domain/usecases/get_trending_tv_show_usecase.dart';
import 'package:movie_app/src/presentation/bloc/movie_bloc.dart';
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
      home: BlocProvider(
          create: (_) => MovieBloc(
                getTopRatedMovieUseCase: GetTopRatedMovieUseCase(
                    GetMovieRepoImpl(GetMovieRemoteDataSourceImpl(
                        apiProvider: ApiProvider()))),
                getTrendingMovieUseCase: GetTrendingMovieUseCase(
                    GetMovieRepoImpl(GetMovieRemoteDataSourceImpl(
                        apiProvider: ApiProvider()))),
                getTrendingTvShowUseCase: GetTrendingTvShowUseCase(
                    GetMovieRepoImpl(GetMovieRemoteDataSourceImpl(
                        apiProvider: ApiProvider()))),
              ),
          child: const HomeScreen()),
      routes: routes,
    );
  }
}
