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
  @override
  List<Object> get props => [];
}
class ErrorState extends MovieState {
  @override
  List<Object> get props => [];
}
