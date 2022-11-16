part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class TopRatedApiCall extends MovieEvent{
  @override
  List<Object?> get props => [];
}
class TrendingTvShowApiCall extends MovieEvent{
  @override
  List<Object?> get props => [];
}
class TrendingMovieApiCall extends MovieEvent{
  @override
  List<Object?> get props => [];
}
