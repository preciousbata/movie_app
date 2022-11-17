import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';

import '../../../domain/usecases/get_top_rated_movie_usecase.dart';

part 'top_rated_movie_event.dart';

part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovieUseCase topRatedMovieUseCase;

  TopRatedMovieBloc({required this.topRatedMovieUseCase}) : super(TopRatedMovieInitialState()) {
    on<TopRatedApiCall>((event, emit) async {
      emit(TopRatedMovieLoadingState());
      try {
        var movies = await topRatedMovieUseCase.call(NoParams());

        if (movies.length > 5){
          movies = movies.take(5).toList();
        }
        emit(TopRatedMovieLoadedState(movies: movies));
      } on Exception catch (e) {
        emit(ErrorState(message: '$e'));
      }
    });
  }
}
