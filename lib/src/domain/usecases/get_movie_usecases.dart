import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/trending_tv_show_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetMovieUseCase extends UseCase<MovieEntity, NoParams> {
  final GetMovieRepository movieRepository;

  GetMovieUseCase(this.movieRepository);

  @override
  Future<MovieEntity> call(NoParams params) {
    return movieRepository.getTrendingMovie();
  }

  // @override
  // Future<MovieEntity> callTopRatedMovie() async {
  //   return await getMovieRepository.getTopRatedMovie();
  // }
  //
  // @override
  // Future<MovieEntity> callTrendingMovie() async {
  //   return await getMovieRepository.getTrendingMovie();
  // }
  //
  // @override
  // Future<MovieEntity> getTrendingTvShows(NoParams params) async {
  //   return await getMovieRepository.getTrendingTvShow();
  // }
}
