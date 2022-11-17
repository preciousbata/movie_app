import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';

import '../../../injection.dart';
import '../../domain/entity/movie_entity.dart';
import '../screens/movie_detail_screen.dart';

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
      height: 150,
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8, right: 170),
                child: Text(
                  'Top Rated',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 117,
            child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
              bloc: topRatedMovieBloc,
              builder: (context, state) {
                if (state is TopRatedMovieLoadedState) {
                  return buildTopRatedListView(state.movies);
                }else if (state is TopRatedMovieLoadingState){
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
      height: 195,
      width: 150,
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
