import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/domain/repositories/get_movie_repo.dart';

import '../../../domain/usecases/get_top_rated_movie_usecase.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;

  TopRatedMovieBloc({required this.getTopRatedMovieUseCase}) : super(TopRatedMovieInitialState()) {
    on<TopRatedApiCall>((event, emit) {
      try {
        emit(TopRatedMovieLoadedState(getMovieRepository: getTopRatedMovieUseCase.getMovieRepository));
      } on Exception catch (e) {
        emit(ErrorState(message: '$e'));
      }
    });


  }
}
