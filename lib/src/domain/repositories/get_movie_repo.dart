import 'package:movie_app/src/domain/entity/movie_entity.dart';

abstract class GetMovieRepository {
  Future<MovieEntity> getTopRatedMovie();
  Future<MovieEntity> getTrendingMovie();
  Future<MovieEntity> getTrendingTvShow();
}