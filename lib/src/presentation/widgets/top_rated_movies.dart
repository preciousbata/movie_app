import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
import 'package:movie_app/src/presentation/widgets/custom_loading_widget.dart';
import 'package:movie_app/src/presentation/widgets/header.dart';
import 'package:movie_app/src/presentation/widgets/movie_list_view.dart';

import '../../../injection.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({super.key});

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  final topRatedMovieBloc = sl.get<TopRatedMovieBloc>();

  @override
  void initState() {
    topRatedMovieBloc.add(TopRatedApiCall());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 237,
      child: Column(
        children: [
          const Header(
            title: 'Top Rated',
            rightPadding: 205,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 200,
            child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
              bloc: topRatedMovieBloc,
              builder: (context, state) {
                if (state is TopRatedMovieLoadedState) {
                  return MovieListView(movies: state.movies);
                } else if (state is TopRatedMovieLoadingState) {
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
