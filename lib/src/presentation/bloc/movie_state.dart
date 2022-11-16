part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitialState extends MovieState {
  @override
  List<Object> get props => [];
}
class MovieLoadingState extends MovieState {
  @override
  List<Object> get props => [];
}
class MovieLoadedState extends MovieState {
  final GetMovieRepository getMovieRepository;

  const MovieLoadedState({required this.getMovieRepository});
  @override
  List<Object> get props => [getMovieRepository];
}
class ErrorState extends MovieState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
