import 'package:movie_app/src/data/data_source/get_movie_remote_data_source.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetMovieRepoImpl implements GetMovieRepository {
  final GetMovieRemoteDataSource movieRemoteDataSource;

  GetMovieRepoImpl(this.movieRemoteDataSource);

  @override
  Future<List<MovieEntity>> getTopRatedMovies() {
    return movieRemoteDataSource.getTopRatedMovie();
  }

  @override
  Future<List<MovieEntity>> getTrendingMovies() {
    return movieRemoteDataSource.getTrendingMovies();
  }

  @override
  Future<List<MovieEntity>> getTrendingTvShows() {
    return movieRemoteDataSource.getTrendingTvShow();
  }
}
