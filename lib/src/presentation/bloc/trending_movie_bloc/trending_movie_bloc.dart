import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

import '../../../domain/usecases/get_trending_movie_usecase.dart';

part 'trending_movie_event.dart';
part 'trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovieUseCase getTrendingMovieUseCase;
  TrendingMovieBloc({required this.getTrendingMovieUseCase}) : super(TrendingMovieInitial()) {
    on<TrendingMovieApiCall>((event, emit) {
      try{
        emit(TrendingMovieLoadedState(getTrendingMovieUseCase.getMovieRepository));
      }on Exception catch (e) {
        emit(ErrorState('$e'));
      }
    });
  }
}
