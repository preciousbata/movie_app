import 'package:flutter_dotenv/flutter_dotenv.dart';

String? apiKey = dotenv.env['API_KEY'];
const double defaultPadding = 16.0;
String searchMovieUrl =
    'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&page=1&query=vampire%20diary&include_adult=false';
String searchTvShowUrl =
    'https://api.themoviedb.org/3/search/tv?api_key=$apiKey&page=1&query=vampire%20diary&include_adult=false';
String trendingMovieUrl =
    'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';
String topRatedMovieUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
String trendingTvShowUrl =
    'https://api.themoviedb.org/3/trending/tv/day?api_key=$apiKey';
