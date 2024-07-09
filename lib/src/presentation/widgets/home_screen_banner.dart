import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/src/presentation/widgets/custom_loading_widget.dart';

class HomeScreenBanner extends StatefulWidget {
  const HomeScreenBanner({
    super.key,
  });

  @override
  State<HomeScreenBanner> createState() => _HomeScreenBannerState();
}

class _HomeScreenBannerState extends State<HomeScreenBanner> {
  final trendingTvShowBloc = sl.get<TrendingMovieBloc>();

  @override
  void initState() {
    trendingTvShowBloc.add(const TrendingMovieApiCall(isTrendingMovies: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
        bloc: trendingTvShowBloc,
        builder: (context, state) {
          if (state is TrendingMovieLoadedState) {
            return Container(
              height: height * 0.48,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'http://image.tmdb.org/t/p/w500/${state.trendingTvShows[0].posterPath}',
                    ),
                    fit: BoxFit.fill,
                    colorFilter: const ColorFilter.mode(
                        Colors.black12, BlendMode.darken)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customBannerIcon(true, null),
                      const SizedBox(
                        width: 20,
                      ),
                      customBannerIcon(false, state.trendingTvShows[0])
                    ],
                  ),
                ),
              ),
            );
          } else if (state is TrendingMovieLoading) {
            return const CustomLoadingIndicator(isBanner: true,);
          }
          return const SizedBox.shrink();
        });
  }

  Widget customBannerIcon(bool isDetails, MovieEntity? movie) {
    return Container(
      height: 30,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border:
            Border.all(color: isDetails ? Colors.transparent : Colors.white60),
        color: isDetails ? Colors.grey.shade700 : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isDetails
              ? const Icon(
                  Icons.play_circle_fill_outlined,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
          isDetails
              ? const SizedBox(
                  width: 8,
                )
              : const SizedBox.shrink(),
          isDetails
              ? const Text(
                  'Play',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              : GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetailScreen(
                        screenArg: MovieDetailScreenArg(
                          movie: movie!,
                          onPress: () {
                            debugPrint('Hello World');
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  child: const Text('Details',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                )
        ],
      ),
    );
  }
}
