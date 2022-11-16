import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/presentation/bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movie_app/src/presentation/bloc/trending_tv_show_bloc/trendingtv_show_bloc.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_movie_list_tile.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_tvshow_list_tile.dart';

import '../../../../injection.dart';

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

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    _getTrendingTvShowData();
    _getTrendingMovieData();
    super.initState();
  }

  void _getTrendingTvShowData() {
    final trendingTvShowBloc = sl.get<TrendingTvShowBloc>();
    trendingTvShowBloc.add(TrendingTvShowApiCall());
  }

  void _getTrendingMovieData()  {
    final trendingMovieBloc = sl.get<TrendingMovieBloc>();
    trendingMovieBloc.add(TrendingMovieApiCall());
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
                      builder: (context, state) {
                        if (state is TrendingMovieLoadedState) {
                          return buildTrendingMovieListView(state);
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    // height: 390,
                    child: BlocBuilder<TrendingTvShowBloc, TrendingTvShowState>(
                      builder: (context, state) {
                        if (state is TrendingTvShowLoadedState) {
                          return buildTrendingTvShowListView(state);
                        }
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

  ListView buildTrendingTvShowListView(TrendingTvShowLoadedState state) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, int index) {
          return TrendingTvshowListTile(
            title: state.getMovieRepository.getTrendingTvShow,
            imageUrl: trendingTvShow[index].backdropPath,
          );
        });
  }

  ListView buildTrendingMovieListView(TrendingMovieLoadedState state) {
    return ListView.builder(
        itemCount: trendingMovies.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, int index) {
          return TrendingMovieListTile(
            title: state.getMovieRepository.getTrendingMovie
          );
        });
  }
}
