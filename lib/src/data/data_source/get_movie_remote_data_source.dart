import 'package:movie_app/src/core/api_provider.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';

import '../../../constant.dart';
import '../model/movie_model.dart';

abstract class GetMovieRemoteDataSource {
  Future<MovieEntity> getTopRatedMovie();

  Future<List<MovieEntity>> getTrendingMovies();

  Future<MovieEntity> getTrendingTvShow();
}

class GetMovieRemoteDataSourceImpl implements GetMovieRemoteDataSource {
  final ApiProvider apiProvider;

  GetMovieRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<MovieEntity> getTopRatedMovie() async {
    final Map<String, dynamic> jsonResponse = await apiProvider.get('movie/top_rated?api_key=$apiKey');
    final data = MovieEntity.fromJson(jsonResponse);
    return data;
  }

  @override
  Future<List<MovieEntity>> getTrendingMovies() async {
    final response = await apiProvider.get('trending/movie/day?api_key=$apiKey');
    if (response['results'] == null) return [];
    return List.from(response['results']).map((e) => MovieEntity.fromJson(e)).toList();
  }

  @override
  Future<MovieEntity> getTrendingTvShow() async {
    final Map<String, dynamic> jsonResponse = await apiProvider.get('trending/tv/day?api_key=$apiKey');
    final data = MovieEntity.fromJson(jsonResponse);
    return data;
  }
}
