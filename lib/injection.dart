import 'package:get_it/get_it.dart';
import 'package:movie_app/repository/top_rated_movie_repository.dart';
import 'package:movie_app/repository/trending_repository.dart';
import 'package:movie_app/utils/movies_service.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(
      () => TrendingRepository(sl.get()));
  sl.registerFactory(() => ApiService());
  sl.registerLazySingleton(() => TopRatedMoviesRepository(sl.get()));
}
