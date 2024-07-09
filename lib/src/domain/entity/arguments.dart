import 'package:movie_app/src/domain/entity/movie_entity.dart';

class Arguments{
  final String?  header;
  final MovieEntity? movie;
  final List<MovieEntity>? movies;
  final bool? isTrendingMovies;

  Arguments({required this.isTrendingMovies, required this.header, required this.movie, required this.movies});
}