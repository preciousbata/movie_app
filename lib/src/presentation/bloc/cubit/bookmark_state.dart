part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkEmpty extends BookmarkState {}

class IsBookmarked extends BookmarkState {
  final bool isMovieBookmarked;

  const IsBookmarked({required this.isMovieBookmarked});
}

class BookmarkUpdated extends BookmarkState {
  final bool isMovieBookmarked;
  final BookMark bookMark;

  const BookmarkUpdated(
      {required this.bookMark, required this.isMovieBookmarked});
}

class BookmarkLoading extends BookmarkState {}

class BookmarkAddedSuccessfully extends BookmarkState {
  final String message;

  const BookmarkAddedSuccessfully({required this.message});
}

class BookmarkRemovedSuccessfully extends BookmarkState {
  final String message;

  const BookmarkRemovedSuccessfully({required this.message});
}

class BookmarkDeletedSuccessfully extends BookmarkState {
  final String message;

  const BookmarkDeletedSuccessfully({required this.message});
}

class BookmarkLoaded extends BookmarkState {
  final List<BookMark> bookmark;

  const BookmarkLoaded({required this.bookmark});
}

class BookmarkError extends BookmarkState {
  final String message;

  const BookmarkError({required this.message});
}
