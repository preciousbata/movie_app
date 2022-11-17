import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_movie_list_tile.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_tvshow_list_tile.dart';

import '../../../../injection.dart';
import '../../screens/movie_detail_screen.dart';

class CustomTrendingTabBar extends StatefulWidget {
  const CustomTrendingTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTrendingTabBar> createState() => _CustomTrendingTabBarState();
}

class _CustomTrendingTabBarState extends State<CustomTrendingTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final trendingMovieBloc = sl.get<TrendingMovieBloc>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    trendingMovieBloc.add(TrendingMovieApiCall());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 55,
                  width: 280,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: TabBar(
                          controller: tabController,
                          indicatorColor: Colors.amber,
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          unselectedLabelColor: Colors.grey,
                          indicator: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          tabs: const [
                            Tab(
                              text: 'Movies',
                            ),
                            Tab(
                              text: 'TV Show',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    // height: 390,
                    child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
                      bloc: trendingMovieBloc,
                      builder: (context, state) {
                        if (state is TrendingMovieLoadedState) {
                          return _buildTrendingMovieListView(
                              state.trendingMovies);
                        } else if (state is TrendingMovieLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.amber,
                          ));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    // height: 390,
                    child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
                      bloc: trendingMovieBloc,
                      builder: (context, state) {
                        if (state is TrendingMovieLoadedState) {
                          return _buildTrendingTvShowListView(
                              state.trendingTvShows);
                        } else if (state is TrendingMovieLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.amber,
                          ));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildTrendingTvShowListView(List<MovieEntity> movies) {
    return ListView.builder(
      itemCount: movies.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, int index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, MovieDetailScreen.routeName,
              arguments: movie),
          child: TrendingTvshowListTile(
            title: movie.name,
            imageUrl: movie.backdropPath,
            index: index + 1,
          ),
        );
      },
    );
  }

  ListView _buildTrendingMovieListView(List<MovieEntity> movies) {
    return ListView.builder(
      itemCount: movies.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, int index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, MovieDetailScreen.routeName,
              arguments: movie),
          child: TrendingMovieListTile(
            title: movie.title,
            imageUrl: movie.backdropPath,
            index: index + 1,
          ),
        );
      },
    );
  }
}
