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
  final List<MovieEntity> movies;
  final List<MovieEntity> sublistmovies;
  final String header;

  const TopRatedMovieLoadedState({required this.movies,required this.sublistmovies, required this.header});
  @override
  List<Object> get props => [movies];
}
class ErrorState extends TopRatedMovieState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
