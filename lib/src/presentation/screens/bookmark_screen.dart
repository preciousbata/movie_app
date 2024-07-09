import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection.dart';
import 'package:movie_app/src/presentation/bloc/cubit/bookmark_cubit.dart';
import 'package:movie_app/src/presentation/widgets/movie_list_view.dart';

class BookMarkScreen extends StatefulWidget {
  static String routeName = '/bookmark';
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  final _cubit = sl.get<BookmarkCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.getAllBookmark();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkCubit, BookmarkState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BookmarkLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Bookmarks',
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MovieListView(
                  movies: state.bookmark.map((e) => e.movie).toList(),
                  scrollDirection: Axis.vertical,
                  isHomeScreen: false,
                  isTrendingMovies: false),
            ),
          );
        } else if (state is BookmarkLoading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()));
        } else if (state is BookmarkEmpty) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('No Bookmark yet!!'),
            ),
          );
        }
        return Container(
          color: Colors.black,
        );
      },
    );
  }
}
