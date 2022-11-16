import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

import '../../domain/usecases/get_top_rated_movie_usecase.dart';
import '../../domain/usecases/get_trending_movie_usecase.dart';
import '../../domain/usecases/get_trending_tv_show_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  final GetTrendingMovieUseCase getTrendingMovieUseCase;
  final GetTrendingTvShowUseCase getTrendingTvShowUseCase;

  MovieBloc({required this.getTopRatedMovieUseCase, required this.getTrendingMovieUseCase, required this.getTrendingTvShowUseCase}) : super(MovieInitialState()) {
    on<TopRatedApiCall>((event, emit) {
      try {
        emit(MovieLoadedState(getMovieRepository: getTopRatedMovieUseCase.getMovieRepository));
      } on Exception catch (e) {
        emit(ErrorState(message: '$e'));
      }
    });
    on <TrendingMovieApiCall>((event, emit) {
      try {
        emit(MovieLoadedState(getMovieRepository: getTrendingMovieUseCase.getMovieRepository));
      } on Exception catch (e) {
        emit(ErrorState(message: '$e'));
      }
    });

    on <TrendingTvShowApiCall>((event, emit) {
      try {
        emit(MovieLoadedState(getMovieRepository: getTrendingTvShowUseCase.getMovieRepository));
      } on Exception catch (e) {
        emit(ErrorState(message: '$e'));
      }
    });

  }
}
