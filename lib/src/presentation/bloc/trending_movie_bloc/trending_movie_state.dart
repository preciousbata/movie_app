part of 'trending_movie_bloc.dart';

abstract class TrendingMovieState extends Equatable {
  const TrendingMovieState();
}

class TrendingMovieInitial extends TrendingMovieState {
  @override
  List<Object> get props => [];
}
class TrendingMovieLoading extends TrendingMovieState {
  @override
  List<Object> get props => [];
}
class TrendingMovieLoadedState extends TrendingMovieState {
  final GetMovieRepository getMovieRepository;
  const TrendingMovieLoadedState(this.getMovieRepository);
  @override
  List<Object> get props => [];
}
class ErrorState extends TrendingMovieState {
  final String message;
  const ErrorState(this.message);
  @override
  List<Object> get props => [];
}

