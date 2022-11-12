import 'package:movie_app/src/core/api_provider.dart';
import 'package:movie_app/src/data/data_source/get_movie_remote_data_source.dart';
import 'package:movie_app/src/domain/entity/trending_tv_show_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetMovieRepoImpl implements GetMovieRepository {
  final GetMovieRemoteDataSource getMovieRemoteDataSource;

  GetMovieRepoImpl(this.getMovieRemoteDataSource);

  @override
  Future<MovieEntity> getTopRatedMovie() async {
  final remoteTopRatedMovie = await getMovieRemoteDataSource.getTopRatedMovie();
  return remoteTopRatedMovie;
  }

  @override
  Future<MovieEntity> getTrendingMovie() async {
    final remoteTrendingMovies = await getMovieRemoteDataSource.getTrendingMovie();
    return remoteTrendingMovies;
  }

  @override
  Future<MovieEntity> getTrendingTvShow() async {
    final remoteTrendingTvShow = await getMovieRemoteDataSource.getTrendingTvShow();
    return remoteTrendingTvShow;
  }
}
