import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/bookmark_service.dart';
import 'package:movie_app/src/domain/entity/bookmark.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final DatabaseHelper databaseHelper;
  BookmarkCubit({required this.databaseHelper}) : super(BookmarkInitial());

  Future<void> addToBookmark(BookMark bookMark) async {
    emit(BookmarkLoading());
    try {
      await databaseHelper.insertBookmark(bookMark);
      // emit(state.)
      emit(const BookmarkAddedSuccessfully(
          message: 'Bookmark successfully added'));
      bool isbookmarked = await databaseHelper.isMovieBookmarked(bookMark.id);
      emit(
          BookmarkUpdated(isMovieBookmarked: isbookmarked, bookMark: bookMark));
    } on Exception catch (e) {
      emit(const BookmarkError(message: 'Unable to add movie to bookmark'));
      print(e);
    }
  }

  Future<void> deleteBookmark(int bookmarkId) async {
    emit(BookmarkLoading());
    try {
      await databaseHelper.deleteBookmark(bookmarkId);
      emit(const BookmarkDeletedSuccessfully(
          message: 'Bookmark successfully deleted'));
    } on Exception catch (e) {
      emit(const BookmarkError(message: 'Unable to delete movie to bookmark'));
      print(e);
    }
  }

  Future<void> getAllBookmark() async {
    emit(BookmarkLoading());
    try {
      var bookmarks = await databaseHelper.getBookmarks();
      if (bookmarks.isEmpty) {
        emit(BookmarkEmpty());
      } else {
        emit(BookmarkLoaded(bookmark: bookmarks));
      }
    } on Exception catch (e) {
      emit(const BookmarkError(message: 'Unable to retrieve bookmarks'));
      print(e);
    }
  }

  Future<void> checkIfBookmark(int movieId) async {
    emit(BookmarkLoading());
    try {
      bool result = await databaseHelper.isMovieBookmarked(movieId);
      emit(IsBookmarked(isMovieBookmarked: result));
    } on Exception catch (e) {
      emit(const BookmarkError(message: 'Unable to retrieve bookmarks'));
      print(e);
    }
  }
}
