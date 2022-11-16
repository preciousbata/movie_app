import 'package:movie_app/src/domain/entity/movie_entity.dart';

abstract class GetMovieRepository {
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getTrendingMovies();
  Future<List<MovieEntity>> getTrendingTvShows();
}