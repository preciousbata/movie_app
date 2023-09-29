import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/src/presentation/widgets/movie_card.dart';

class MovieListView extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        separatorBuilder: (_, __) => const SizedBox(
              width: 20,
            ),
        itemBuilder: (content, int index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, MovieDetailScreen.routeName,
                arguments: movie),
            child: MovieCard(title: movie.title, imageUrl: movie.backdropPath),
          );
        });
  }
}
