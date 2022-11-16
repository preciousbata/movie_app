import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetTrendingTvShowUseCase extends UseCases<MovieEntity, NoParams> {
  final GetMovieRepository getMovieRepository;

  GetTrendingTvShowUseCase(this.getMovieRepository);

  @override
  Future<MovieEntity> call(NoParams params) async {
    return await getMovieRepository.getTrendingTvShow();
  }

}