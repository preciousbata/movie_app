import 'package:http/http.dart' as http;
import 'package:movie_app/constant.dart';
import 'package:movie_app/model/top_movie_model.dart';
import 'package:movie_app/model/trending_movies.dart';
import 'package:movie_app/model/trending_tvshow_model.dart';

class ApiService {
  Future<List<TvShowResult>?> getTrendingTvShow() async {
    final response =
        await http.get(Uri.parse(trendingTvShowUrl));

    if (response.statusCode == 200) {
     return tvShowResponseFromJson(response.body);
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<TrendingMovieResult>?> getTrendingMovie() async {
    final response =
    await http.get(Uri.parse(trendingTvShowUrl));

    if (response.statusCode == 200) {
      return trendingMovieResponseFromJson(response.body);
    } else {
      throw Exception('something went wrong');
    }
  }

  Future<List<TopRatedMovieModel>?> getTopRatedMovies() async {
    final response =
    await http.get(Uri.parse(topRatedMovieUrl));

    if (response.statusCode == 200) {
      return topRatedMovieResponseFromJson(response.body);
    } else {
      throw Exception('something went wrong');
    }
  }
}
