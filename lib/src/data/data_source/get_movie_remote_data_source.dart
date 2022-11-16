import 'package:movie_app/src/core/api_provider.dart';

import '../../../constant.dart';
import '../model/movie_model.dart';

abstract class GetMovieRemoteDataSource {
  Future<MovieModel> getTopRatedMovie ();
  Future<MovieModel> getTrendingMovie ();
  Future<MovieModel> getTrendingTvShow ();
}

class GetMovieRemoteDataSourceImpl implements GetMovieRemoteDataSource {
  final ApiProvider apiProvider;

  GetMovieRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<MovieModel> getTopRatedMovie() async {
    final Map<String, dynamic> jsonResponse = await apiProvider.get('movie/top_rated?api_key=$apiKey');
    final data = MovieModel.fromJson(jsonResponse);
    return data;
  }

  @override
  Future<MovieModel> getTrendingMovie() async {
    final Map<String, dynamic> jsonResponse = await apiProvider.get('trending/movie/day?api_key=$apiKey');
    final data = MovieModel.fromJson(jsonResponse);
    return data;
  }

  @override
  Future<MovieModel> getTrendingTvShow() async {
    final Map<String, dynamic> jsonResponse = await apiProvider.get('trending/tv/day?api_key=$apiKey');
    final data = MovieModel.fromJson(jsonResponse);
    return data;
  }
}
