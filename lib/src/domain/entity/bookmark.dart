import 'package:movie_app/src/domain/entity/movie_entity.dart';

class BookMark {
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

  BookMark(
      {required this.adult,
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
      required this.voteCount});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'adult': adult ? 1 : 0,
      'backdropPath': backdropPath,
      'name': name,
      'overview': overview,
      'posterPath': posterPath,
      'genreIds':
          genreIds.join(','), // Convert List<int> to a comma-separated String
      'popularity': popularity,
      'firstAirDate':
          firstAirDate.toIso8601String(), // Convert DateTime to ISO 8601 String
      'voteAverage': voteAverage,
      'voteCount': voteCount
    };
  }

  MovieEntity get movie {
    return MovieEntity(
        adult: true,
        backdropPath: backdropPath,
        id: id,
        name: name,
        title: title,
        overview: overview,
        posterPath: posterPath,
        genreIds: genreIds,
        popularity: popularity,
        firstAirDate: firstAirDate,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }

  @override
  String toString() {
    return 'BookMark{adult: $adult, backdropPath: $backdropPath, id: $id, name: $name, title: $title, overview: $overview, posterPath: $posterPath, genreIds: $genreIds, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}
