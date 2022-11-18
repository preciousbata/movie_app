import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';

import '../../../injection.dart';
import '../../domain/entity/movie_entity.dart';
import '../screens/movie_detail_screen.dart';

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
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8, right: 140),
                child: Text(
                  'Trending Movies',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16),
              )
            ],
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
                  return buildTopRatedListView(state.trendingMovies);
                }else if (state is TrendingMovieLoading){
                  return const Center(child:CircularProgressIndicator(
                    color: Colors.amber,
                  ),);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  ListView buildTopRatedListView(List<MovieEntity> movies) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        separatorBuilder: (_, __) => const SizedBox(
          width: 20,
        ),
        itemBuilder: (content, int index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, MovieDetailScreen.routeName, arguments: movie),
            child: buildMovieContainer(
                title: movie.title,
                imageUrl: movie.backdropPath),
          );
        });
  }

  Widget buildMovieContainer(
      {required String imageUrl, required String title}) {
    return Container(
      height: 200,
      width: 166,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('http://image.tmdb.org/t/p/w500/$imageUrl'),
              fit: BoxFit.cover,
              colorFilter:
              const ColorFilter.mode(Colors.black12, BlendMode.darken)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
