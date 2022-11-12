import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/trending_tv_show_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetMovieUseCases extends UseCases {
  final GetMovieRepository getMovieRepository;

  GetMovieUseCases(this.getMovieRepository);

  @override
  Future<MovieEntity> callTopRatedMovie() async {
    return await getMovieRepository.getTopRatedMovie();
  }

  @override
  Future<MovieEntity> callTrendingMovie() async {
    return await getMovieRepository.getTrendingMovie();
  }

  @override
  Future<MovieEntity> callTrendingTvShow() async {
    return await getMovieRepository.getTrendingTvShow();
  }
}
