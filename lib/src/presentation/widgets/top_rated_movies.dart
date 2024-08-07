import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/domain/entity/arguments.dart';
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
import 'package:movie_app/src/presentation/screens/view_all_screen.dart';
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
    return BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
      bloc: topRatedMovieBloc,
      builder: (context, state) {
        if (state is TopRatedMovieLoadedState) {
          return SizedBox(
            height: 230,
            child: Column(
              children: [
                Header(
                    title: state.header,
                    rightPadding: 156,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewAllScreen(
                            arguments: Arguments(
                                header: state.header,
                                movie: null,
                                isTrendingMovies: true,
                                movies: state.movies),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: MovieListView(
                    movies: state.sublistmovies,
                    scrollDirection: Axis.horizontal,
                    isTrendingMovies: true,
                  ),
                ),
              ],
            ),
          );
        } else if (state is TopRatedMovieLoadingState) {
          return const CustomLoadingIndicator(isBanner: false,);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
