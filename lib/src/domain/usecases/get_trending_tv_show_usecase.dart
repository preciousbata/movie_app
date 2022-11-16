import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

class GetTrendingTvShowUseCase extends UseCase<List<MovieEntity>, NoParams> {
  final GetMovieRepository movieRepository;

  GetTrendingTvShowUseCase(this.movieRepository);

  @override
  Future<List<MovieEntity>> call(NoParams params) {
    return movieRepository.getTrendingTvShows();
  }
}
