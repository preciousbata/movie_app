class MovieEntity {
  MovieEntity({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  int id;
  String name;
  String originalName;
  String overview;
  String posterPath;
  List<int> genreIds;
  double popularity;
  DateTime firstAirDate;
  double voteAverage;
  int voteCount;
}

