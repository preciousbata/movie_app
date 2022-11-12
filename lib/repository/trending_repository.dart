import 'package:movie_app/model/trending_movies.dart';
import 'package:movie_app/model/trending_tvshow_model.dart';
import 'package:movie_app/utils/movies_service.dart';

class TrendingRepository {
  final ApiService apiService;

  TrendingRepository(this.apiService);
  Future<List<TvShowResult>?> getTvShow() async {
    final tvshow = await apiService.getTrendingTvShow();
    return tvshow!.isEmpty ? null : tvshow;
  }
  Future<List<TrendingMovieResult>?> getTrendingMovie() async {
    final trendingMovies = await apiService.getTrendingMovie();
    return trendingMovies!.isEmpty ? null : trendingMovies;
  }
}
