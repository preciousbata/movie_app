import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/src/presentation/widgets/movie_card.dart';
import 'package:movie_app/src/presentation/widgets/view_all_movie_card.dart';

class MovieListView extends StatelessWidget {
  final List<MovieEntity> movies;
  final Axis scrollDirection;
  final bool isHomeScreen, isTrendingMovies;

  const MovieListView({
    super.key,
    required this.movies,
    required this.scrollDirection,
    this.isHomeScreen = true,
    required this.isTrendingMovies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: scrollDirection,
      itemCount: movies.length,
      separatorBuilder: (_, __) => isHomeScreen
          ? const SizedBox(
              width: 8,
            )
          : const SizedBox(
              height: 8,
            ),
      itemBuilder: (_, int index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MovieDetailScreen(
                screenArg: MovieDetailScreenArg(
                  movie: movie,
                  onPress: () {
                    debugPrint('Hello World');
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          child: isHomeScreen
              ? MovieCard(
                  title: isTrendingMovies ? movie.title : movie.name,
                  imageUrl: movie.posterPath,
                )
              : ViewAllMovieCard(
                  title: isTrendingMovies ? movie.title : movie.name,
                  imageUrl: movie.posterPath,
                ),
          //       )
        );
      },
    );
  }
}
