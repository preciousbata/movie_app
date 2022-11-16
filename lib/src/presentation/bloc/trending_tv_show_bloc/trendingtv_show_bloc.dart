import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repositories/get_movie_repo.dart';
import '../../../domain/usecases/get_trending_tv_show_usecase.dart';

part 'trendingtv_show_event.dart';
part 'trendingtv_show_state.dart';

class TrendingTvShowBloc extends Bloc<TrendingTvShowEvent, TrendingTvShowState> {
  final GetTrendingTvShowUseCase getTrendingTvShowUseCase;
  TrendingTvShowBloc({required this.getTrendingTvShowUseCase}) : super(TrendingTvShowInitial()) {
    on<TrendingTvShowEvent>((event, emit) {
     try {
       emit(TrendingTvShowLoadedState(getMovieRepository: getTrendingTvShowUseCase.getMovieRepository));
     }on Exception catch (e) {
       emit(ErrorState(message: '$e'));
     }
    });
  }
}
