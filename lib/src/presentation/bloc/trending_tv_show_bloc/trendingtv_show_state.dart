part of 'trendingtv_show_bloc.dart';

abstract class TrendingTvShowState extends Equatable {
  const TrendingTvShowState();
}

class TrendingTvShowInitial extends TrendingTvShowState {
  @override
  List<Object> get props => [];
}
class TrendingTvShowLoadingState extends TrendingTvShowState {
  @override
  List<Object> get props => [];
}
class TrendingTvShowLoadedState extends TrendingTvShowState {
  final GetMovieRepository getMovieRepository;

  const TrendingTvShowLoadedState({required this.getMovieRepository});
  @override
  List<Object> get props => [getMovieRepository];
}
class ErrorState extends TrendingTvShowState {
  final String message;
  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}