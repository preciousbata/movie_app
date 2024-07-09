import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/domain/entity/arguments.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/screens/view_all_screen.dart';
import 'package:movie_app/src/presentation/widgets/custom_loading_widget.dart';
import 'package:movie_app/src/presentation/widgets/header.dart';
import 'package:movie_app/src/presentation/widgets/movie_list_view.dart';

import '../../../injection.dart';

class TrendingTvShow extends StatefulWidget {
  const TrendingTvShow({super.key});

  @override
  State<TrendingTvShow> createState() => _TrendingTvShow();
}

class _TrendingTvShow extends State<TrendingTvShow> {
  final trendingTvShowBloc = sl.get<TrendingMovieBloc>();

  @override
  void initState() {
    trendingTvShowBloc.add(const TrendingMovieApiCall(isTrendingMovies: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
        bloc: trendingTvShowBloc,
        builder: (context, state) {
          if (state is TrendingMovieLoadedState) {
            return SizedBox(
              height: 230,
              child: Column(
                children: [
                  Header(
                    title: state.header,
                    rightPadding: 135,
                    onTap: () {
                      Navigator.pushNamed(context, ViewAllScreen.routeName,
                          arguments: Arguments(
                              header: state.header,
                              movie: null,
                              isTrendingMovies: false,
                              movies: state.trendingTvShows));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 180,
                    child: MovieListView(
                      movies: state.subtrendingTvShows,
                      scrollDirection: Axis.horizontal,
                      isTrendingMovies: false,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is TrendingMovieLoading) {
            return const CustomLoadingIndicator(
              isBanner: false,
            );
          }
          return const SizedBox.shrink();
        });
  }
}
