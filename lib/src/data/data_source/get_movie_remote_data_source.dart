import 'package:movie_app/src/core/api_provider.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';

import '../../../constant.dart';

abstract class GetMovieRemoteDataSource {
  Future<List<MovieEntity>> getTopRatedMovie();

  Future<List<MovieEntity>> getTrendingMovies();

  Future<List<MovieEntity>> getTrendingTvShow();
}

class GetMovieRemoteDataSourceImpl implements GetMovieRemoteDataSource {
  final ApiProvider apiProvider;

  GetMovieRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<MovieEntity>> getTopRatedMovie() async {
    final response = await apiProvider.get('movie/top_rated?api_key=$apiKey');
    if (response['results'] == null) return [];
    return List.from(response['results']).map((e) => MovieEntity.fromJson(e)).toList();
  }

  @override
  Future<List<MovieEntity>> getTrendingMovies() async {
    final response = await apiProvider.get('trending/movie/day?api_key=$apiKey');
    if (response['results'] == null) return [];
    return List.from(response['results']).map((e) => MovieEntity.fromJson(e)).toList();
  }

  @override
  Future<List<MovieEntity>> getTrendingTvShow() async {
    final response = await apiProvider.get('trending/tv/day?api_key=$apiKey');
    if (response['results'] == null) return [];
    return List.from(response['results']).map((e) => MovieEntity.fromJson(e)).toList();
  }
}
