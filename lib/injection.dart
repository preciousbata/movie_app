import 'package:get_it/get_it.dart';
import 'package:movie_app/src/core/api_provider.dart';
import 'package:movie_app/src/data/data_source/get_movie_remote_data_source.dart';
import 'package:movie_app/src/data/repositories/get_movie_repo_impl.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';
import 'package:movie_app/src/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/src/domain/usecases/get_trending_movie_usecase.dart';
import 'package:movie_app/src/domain/usecases/get_trending_tv_show_usecase.dart';
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';

final sl = GetIt.instance;

void init() {
  //use_cases
  sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl.get()));
  sl.registerLazySingleton(() => GetTrendingTvShowUseCase(sl.get()));
  sl.registerLazySingleton(() => GetTrendingMovieUseCase(sl.get()));

  //bloc
  sl.registerFactory(() => TopRatedMovieBloc(topRatedMovieUseCase: sl.get()));
  sl.registerFactory(() => TrendingMovieBloc(trendingTvShowUseCase: sl.get(), trendingMovieUseCase: sl.get()));

  // Data Sources
  sl.registerLazySingleton<GetMovieRemoteDataSource>(() => GetMovieRemoteDataSourceImpl(apiProvider: sl.get()));

  // Core
  sl.registerLazySingleton(() => ApiProvider());

  //Repo
  sl.registerLazySingleton<GetMovieRepository>(() => GetMovieRepoImpl(sl.get()));
}
