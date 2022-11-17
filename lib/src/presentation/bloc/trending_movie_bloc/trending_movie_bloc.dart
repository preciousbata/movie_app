import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/domain/usecases/get_trending_tv_show_usecase.dart';

import '../../../domain/usecases/get_trending_movie_usecase.dart';

part 'trending_movie_event.dart';

part 'trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovieUseCase trendingMovieUseCase;
  final GetTrendingTvShowUseCase trendingTvShowUseCase;

  TrendingMovieBloc({required this.trendingMovieUseCase, required this.trendingTvShowUseCase}) : super(TrendingMovieInitial()) {
    on<TrendingMovieApiCall>((event, emit) async {
      emit(TrendingMovieLoading());
      try {
        final result = await Future.wait<List<MovieEntity>>([
          trendingMovieUseCase.call(NoParams()),
          trendingTvShowUseCase.call(NoParams()),
        ]);

        if (result[0].length > 5) {
          result[0] = result[0].take(5).toList();
        }
        if (result[1].length > 5) {
          result[1] = result[1].take(5).toList();
        }

        emit(TrendingMovieLoadedState(result[0], result[1]));
      } on Exception catch (e) {
        emit(ErrorState('$e'));
      }
    });
  }
}
