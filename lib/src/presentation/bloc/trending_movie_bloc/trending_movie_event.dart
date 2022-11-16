part of 'trending_movie_bloc.dart';

abstract class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();
}

class TrendingMovieApiCall extends TrendingMovieEvent {
  @override
  List<Object?> get props => [];

}