import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/domain/entity/arguments.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/screens/view_all_screen.dart';
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
    trendingMovieBloc.add(const TrendingMovieApiCall(isTrendingMovies: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
        bloc: trendingMovieBloc,
        builder: (context, state) {
          if (state is TrendingMovieLoadedState) {
            return SizedBox(
              height: 230,
              child: Column(
                children: [
                  Header(
                    title: state.header,
                    rightPadding: 167,
                    onTap: () {
                      Navigator.pushNamed(context, ViewAllScreen.routeName,
                          arguments: Arguments(
                              header: state.header,
                              movie: null,
                              isTrendingMovies: true,
                              movies: state.trendingMovies));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 180,
                    child: MovieListView(
                      movies: state.subtrendingMovies,
                      scrollDirection: Axis.horizontal,
                      isTrendingMovies: true,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is TrendingMovieLoading) {
            return const CustomLoadingIndicator(isBanner: false,);
          }
          return const SizedBox.shrink();
        });
  }
}
