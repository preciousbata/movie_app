import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetTrendingMovieUseCase extends UseCase<List<MovieEntity>, NoParams> {
  final GetMovieRepository repository;

  GetTrendingMovieUseCase(this.repository);

  @override
  Future<List<MovieEntity>> call(NoParams params) {
    return repository.getTrendingMovies();
  }
}
