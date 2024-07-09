part of 'trending_movie_bloc.dart';

abstract class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();
}

class TrendingMovieApiCall extends TrendingMovieEvent {
  final bool isTrendingMovies;

  const TrendingMovieApiCall({required this.isTrendingMovies});
  @override
  List<Object?> get props => [];

}