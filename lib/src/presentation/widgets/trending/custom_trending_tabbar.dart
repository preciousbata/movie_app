import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/model/trending_movies.dart';
import 'package:movie_app/model/trending_tvshow_model.dart';
import 'package:movie_app/src/domain/usecases/get_trending_movie_usecase.dart';
import 'package:movie_app/src/domain/usecases/get_trending_tv_show_usecase.dart';
import 'package:movie_app/src/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_movie_list_tile.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_tvshow_list_tile.dart';

import '../../../../injection.dart';
import '../../../domain/usecases/get_top_rated_movie_usecase.dart';

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
  late List<TvShowResult> trendingTvShow = [];
  late List<TrendingMovieResult> trendingMovies = [];
  late MovieBloc movieBloc;
  GetTopRatedMovieUseCase topRatedMovieUseCase =
  sl.get<GetTopRatedMovieUseCase>();
  GetTrendingTvShowUseCase trendingTvShowUseCase =
  sl.get<GetTrendingTvShowUseCase>();
  GetTrendingMovieUseCase trendingMovieUseCase =
  sl.get<GetTrendingMovieUseCase>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    movieBloc = MovieBloc(
        getTopRatedMovieUseCase: topRatedMovieUseCase,
        getTrendingMovieUseCase: trendingMovieUseCase,
        getTrendingTvShowUseCase: trendingTvShowUseCase);
     movieBloc.add(TrendingTvShowApiCall());
    movieBloc.add(TrendingMovieApiCall());
    // _getData();
    super.initState();
  }

  // void _getData() async {
  //   final trending = sl.get<TrendingRepository>();
  //   trendingTvShow = (await trending.getTvShow())!;
  //   trendingMovies = (await trending.getTrendingMovie())!;
  // }

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
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is MovieLoadedState){
                          return ListView.builder(
                              itemCount: trendingMovies.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, int index) {
                                return TrendingMovieListTile(
                                  title: trendingMovies[index].originalTitle,
                                );
                              });
                        }else if(state is ErrorState) {
                          return Center(child: Text(state.message));
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    // height: 390,
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, int index) {
                          return TrendingTvshowListTile(
                            title: trendingTvShow[index].name,
                            imageUrl: trendingTvShow[index].backdropPath,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
