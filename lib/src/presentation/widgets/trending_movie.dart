import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/widgets/custom_loading_widget.dart';
import 'package:movie_app/src/presentation/widgets/header.dart';
import 'package:movie_app/src/presentation/widgets/movie_list_view.dart';

import '../../../injection.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMovies();
}

class _TrendingMovies extends State<TrendingMovies> {
  final trendingMovieBloc = sl.get<TrendingMovieBloc>();

  @override
  void initState() {
    trendingMovieBloc.add(TrendingMovieApiCall());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 237,
      child: Column(
        children: [
          const Header(
            title: 'Trending Movies',
            rightPadding: 167,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 200,
            child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
              bloc: trendingMovieBloc,
              builder: (context, state) {
                if (state is TrendingMovieLoadedState) {
                  return MovieListView(movies: state.trendingMovies);
                } else if (state is TrendingMovieLoading) {
                  return const CustomLoadingIndicator();
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
