import 'package:movie_app/src/domain/entity/trending_tv_show_entity.dart';

abstract class GetMovieRepository {
  Future<MovieEntity> getTopRatedMovie();
  Future<MovieEntity> getTrendingMovie();
  Future<MovieEntity> getTrendingTvShow();
}