import 'package:movie_app/src/domain/entity/movie_entity.dart';

class Movie extends MovieEntity {
  Movie({
    required super.adult,
    required super.backdropPath,
    required super.id,
    required super.name,
    required super.originalName,
    required super.overview,
    required super.posterPath,
    required super.genreIds,
    required super.popularity,
    required super.firstAirDate,
    required super.voteAverage,
    required super.voteCount,
  });
}
