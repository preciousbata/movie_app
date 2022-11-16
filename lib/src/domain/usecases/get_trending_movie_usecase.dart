import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetTrendingMovieUseCase extends UseCases {
  final GetMovieRepository getMovieRepository;

  GetTrendingMovieUseCase(this.getMovieRepository);

  @override
  Future<MovieEntity> call() async {
    return await getMovieRepository.getTrendingMovie();
  }

}