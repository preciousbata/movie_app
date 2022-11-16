import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/usecases/get_movie_usecases.dart';

part 'movie_event.dart';

part 'movie_state.dart';


// provide this to get-it
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieUseCase movieUseCases;

  MovieBloc(this.movieUseCases) : super(MovieInitialState()) {
    on<MovieEvent>((event, emit) async {
      if (event is FetchTrendingMoviesEvent) {
        try {
          final movie = await movieUseCases.call(NoParams());
          emit(MovieLoadedState());
        } catch (exception) {
          emit(MovieInitialState());
        }
      }
    });
  }
}
