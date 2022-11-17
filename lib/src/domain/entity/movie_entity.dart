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
      firstAirDate: json['first_air_date'] != null ? DateTime.parse(json["first_air_date"]) : DateTime.now(),
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
    );
  }
}
