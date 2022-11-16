part of 'top_rated_movie_bloc.dart';

abstract class TopRatedMovieEvent extends Equatable {
  const TopRatedMovieEvent();
}

class TopRatedApiCall extends TopRatedMovieEvent{
  @override
  List<Object?> get props => [];
}

