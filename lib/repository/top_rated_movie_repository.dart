
import 'package:movie_app/model/top_movie_model.dart';

import '../model/trending_movies.dart';
import '../utils/movies_service.dart';

class TopRatedMoviesRepository {
  final ApiService apiService;

  TopRatedMoviesRepository(this.apiService);

  Future<List<TopRatedMovieModel>?> getTopRatedMovie() async {
    final topRatedMovie = await apiService.getTopRatedMovies();
    return topRatedMovie!.isEmpty ? null : topRatedMovie;
  }
}