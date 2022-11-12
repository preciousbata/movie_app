import 'package:flutter/material.dart';
import 'package:movie_app/model/trending_movies.dart';
import 'package:movie_app/model/trending_tvshow_model.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_movie_list_tile.dart';
import 'package:movie_app/src/presentation/widgets/trending/trending_tvshow_list_tile.dart';


import '../../../../injection.dart';
import '../../../../repository/trending_repository.dart';

class CustomTrendingTabBar extends StatefulWidget {
  const CustomTrendingTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTrendingTabBar> createState() =>
      _CustomTrendingTabBarState();
}

class _CustomTrendingTabBarState
    extends State<CustomTrendingTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late  List<TvShowResult> trendingTvShow = [];
  late  List<TrendingMovieResult> trendingMovies = [];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    _getData();
    super.initState();
  }

  void _getData() async {
    final trending =
        sl.get<TrendingRepository>();
     trendingTvShow = (await trending.getTvShow())!;
     trendingMovies = (await trending.getTrendingMovie())!;
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
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          unselectedLabelColor: Colors.grey,
                          indicator: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(
                                      Radius.circular(10))),
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8),
                    // height: 390,
                    child: ListView.builder(
                        itemCount: trendingMovies.length,
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, int index) {
                          return  TrendingMovieListTile(
                            title: trendingMovies[index].originalTitle,

                          );
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8),
                    // height: 390,
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
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
