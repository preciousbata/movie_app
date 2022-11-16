part of 'top_rated_movie_bloc.dart';

abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();
}

class TopRatedMovieInitialState extends TopRatedMovieState {
  @override
  List<Object> get props => [];
}
class TopRatedMovieLoadingState extends TopRatedMovieState {
  @override
  List<Object> get props => [];
}
class TopRatedMovieLoadedState extends TopRatedMovieState {
  final GetMovieRepository getMovieRepository;

  const TopRatedMovieLoadedState({required this.getMovieRepository});
  @override
  List<Object> get props => [getMovieRepository];
}
class ErrorState extends TopRatedMovieState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
