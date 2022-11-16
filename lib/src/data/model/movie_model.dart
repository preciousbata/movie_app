import 'package:movie_app/src/domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel(
      {required super.adult,
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
      required super.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      final movieList = [];
      json['results'].forEach((v) {
        movieList.add(
          MovieModel(
            adult: json["adult"],
            backdropPath: json["backdrop_path"],
            id: json["id"],
            name: json["name"],
            originalName: json["original_name"],
            overview: json["overview"],
            posterPath: json["poster_path"],
            genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
            popularity: json["popularity"].toDouble(),
            firstAirDate: DateTime.parse(json["first_air_date"]),
            voteAverage: json["vote_average"].toDouble(),
            voteCount: json["vote_count"],
          ),
        );
      });
    }
    throw ('Something went wrong');
  }
}
