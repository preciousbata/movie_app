import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/usecase.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';

import '../../../domain/usecases/get_top_rated_movie_usecase.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovieUseCase topRatedMovieUseCase;

  TopRatedMovieBloc({required this.topRatedMovieUseCase})
      : super(TopRatedMovieInitialState()) {
    on<TopRatedApiCall>((event, emit) async {
      emit(TopRatedMovieLoadingState());
      try {
        final List<MovieEntity> sublistMovies;
        List<MovieEntity> movies = await topRatedMovieUseCase.call(NoParams());

        if (movies.length > 5) {
          sublistMovies = movies.take(5).toList();
        } else {
          sublistMovies = movies;
        }
        emit(TopRatedMovieLoadedState(
            movies: movies,
            sublistmovies: sublistMovies,
            header: 'Top Rated Movies'));
      } on Exception catch (e) {
        emit(const ErrorState(message: ' An error while retrieving movie'));
      }
    });
  }
}
