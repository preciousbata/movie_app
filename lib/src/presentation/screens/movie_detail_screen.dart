import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/injection.dart';
import 'package:movie_app/src/core/extension_utils.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/presentation/bloc/cubit/bookmark_cubit.dart';

class MovieDetailScreenArg {
  final MovieEntity movie;
  final VoidCallback? onPress;

  MovieDetailScreenArg({required this.movie, this.onPress});
}

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailScreenArg screenArg;
  static String routeName = '/movie_detail';

  const MovieDetailScreen({Key? key, required this.screenArg})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final _cubit = sl.get<BookmarkCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.checkIfBookmark(widget.screenArg.movie.id);
  }

  late bool _isBookMarked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkCubit, BookmarkState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state is BookmarkAddedSuccessfully) {
          context.showSnackBar(state.message);
        } else if (state is IsBookmarked) {
          _isBookMarked = state.isMovieBookmarked;
        } else if (state is BookmarkDeletedSuccessfully) {
          context.showSnackBar(state.message);
        }
      },
      builder: (context, state) {
        if (state is BookmarkAddedSuccessfully) {
          _movieDetailView(widget.screenArg.onPress, true);
        } else if (state is BookmarkLoading) {
          const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is BookmarkUpdated) {
          return _movieDetailView(widget.screenArg.onPress, true);
        } else if (state is BookmarkDeletedSuccessfully) {
          return _movieDetailView(widget.screenArg.onPress, false);
        }

        return _movieDetailView(widget.screenArg.onPress, _isBookMarked);
      },
    );
  }

  Widget _movieDetailView(VoidCallback? onPress, bool isbookmarked) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 390,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'http://image.tmdb.org/t/p/w500/${widget.screenArg.movie.posterPath}',
                  ),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.white60,
                      child: IconButton(
                        onPressed: onPress,
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor:
                          isbookmarked ? Colors.green.shade300 : Colors.white60,
                      child: IconButton(
                        onPressed: isbookmarked
                            ? () => _cubit.deleteBookmark(
                                widget.screenArg.movie.bookmark.id)
                            : () => _cubit
                                .addToBookmark(widget.screenArg.movie.bookmark),
                        icon: isbookmarked
                            ? const Icon(
                                Icons.bookmark_rounded,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.bookmark_add_rounded,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.screenArg.movie.voteAverage.toStringAsFixed(2),
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
              widget.screenArg.movie.adult
                  ? const Icon(Icons.eighteen_up_rating_outlined)
                  : const Icon(
                      Icons.no_adult_content_outlined,
                      color: Colors.white,
                    ),
              Text(
                DateFormat('yyyy-MM-dd')
                    .format(widget.screenArg.movie.firstAirDate),
                style: const TextStyle(color: Colors.white60),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 45,
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white30),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Play',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.play_circle_outline_rounded,
                    size: 27,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Prologue',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 200,
                child: Text(
                  widget.screenArg.movie.overview,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.white60, fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: const FloatingActionButton.extended(
      //   backgroundColor: Colors.amber,
      //   onPressed: null,
      //   label: Row(
      //     children: [
      //       Text(
      //         'PLAY',
      //         style: TextStyle(
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.white),
      //       ),
      //       SizedBox(
      //         width: 8,
      //       ),
      //       Icon(
      //         Icons.play_circle_outline_rounded,
      //         size: 27,
      //         color: Colors.white,
      //       )
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
