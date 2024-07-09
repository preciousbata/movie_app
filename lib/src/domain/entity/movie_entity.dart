import 'dart:convert';

import 'package:movie_app/src/domain/entity/bookmark.dart';

class MovieEntity {
  bool adult;
  String backdropPath;
  int id;
  String name;
  String title;
  String overview;
  String posterPath;
  List<int> genreIds;
  double popularity;
  DateTime firstAirDate;
  double voteAverage;
  int voteCount;

  MovieEntity({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieEntity.forTest() {
    return MovieEntity(
      adult: true,
      backdropPath: '',
      id: 4,
      name: "Logan",
      title: 'GTA',
      overview: "overview",
      posterPath: "posterPath",
      genreIds: [],
      popularity: 4,
      firstAirDate: DateTime.now(),
      voteAverage: 4,
      voteCount: 4,
    );
  }

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      adult: json["adult"],
      backdropPath: json["backdrop_path"] ?? "",
      id: json["id"],
      name: json["name"] ?? "",
      title: json["title"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      popularity: json["popularity"].toDouble(),
      firstAirDate: json['first_air_date'] != null
          ? DateTime.parse(json["first_air_date"])
          : DateTime.now(),
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
    );
  }

  String toJson() => json.encode(toMap());

  BookMark get bookmark {
    return BookMark(
        id: id,
        title: title,
        posterpath: posterPath,
        backDropPath: backdropPath,
        name: name);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'adult': adult,
      'backdropPath': backdropPath,
      'name': name,
      'overview': overview,
      'posterPath': posterPath,
      'genreIds': genreIds,
      'popularity': popularity,
      'firstAirDate': firstAirDate,
      'voteAverage': voteAverage,
      'voteCount': voteAverage
    };
  }
}
