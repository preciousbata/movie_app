import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetTrendingMovieUseCase extends UseCases<MovieEntity, NoParams> {
  final GetMovieRepository getMovieRepository;

  GetTrendingMovieUseCase(this.getMovieRepository);

  @override
  Future<MovieEntity> call(NoParams params) async {
    return await getMovieRepository.getTrendingMovie();
  }

}