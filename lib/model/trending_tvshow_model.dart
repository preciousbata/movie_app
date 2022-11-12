// To parse this JSON data, do
//
//     final trendingTvShow = trendingTvShowFromJson(jsonString);

import 'dart:convert';

List<TvShowResult> tvShowResponseFromJson(String str) =>
    List<TvShowResult>.from(json
        .decode(str)['results']
        .map((x) => TvShowResult.fromJson(x)));

class TvShowResult {
  TvShowResult({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });

  bool adult;
  String backdropPath;
  int id;
  String name;
  OriginalLanguage? originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  MediaType? mediaType;
  List<int> genreIds;
  double popularity;
  DateTime firstAirDate;
  double voteAverage;
  int voteCount;
  List<String> originCountry;

  factory TvShowResult.fromJson(
          Map<String, dynamic> json) =>
      TvShowResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        originalLanguage: originalLanguageValues
            .map[json["original_language"]],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        genreIds:
            List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"].toDouble(),
        firstAirDate:
            DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        originCountry: List<String>.from(
            json["origin_country"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "name": name,
        "original_language": originalLanguageValues
            .reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "genre_ids":
            List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "first_air_date":
            "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country":
            List<dynamic>.from(originCountry.map((x) => x)),
      };

  @override
  String toString() {
    return 'TvShowResult{adult: $adult, backdropPath: $backdropPath, id: $id, name: $name, originalLanguage: $originalLanguage, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, genreIds: $genreIds, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage, voteCount: $voteCount, originCountry: $originCountry}';
  }
}

enum MediaType { TV }

final mediaTypeValues = EnumValues({"tv": MediaType.TV});

enum OriginalLanguage { EN, SV, JA, FR }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ja": OriginalLanguage.JA,
  "sv": OriginalLanguage.SV
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
