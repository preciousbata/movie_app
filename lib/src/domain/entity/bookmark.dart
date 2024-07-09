import 'package:movie_app/src/domain/entity/movie_entity.dart';

class BookMark {
  final int id;
  final String title, name;
  final String backDropPath, posterpath;

  BookMark(
      {required this.id,
      required this.title,
      required this.posterpath,
      required this.backDropPath,
      required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'name': name,
      'posterpath': posterpath,
      'backDropPath': backDropPath,
    };
  }

  MovieEntity get movie {
    return MovieEntity(
        adult: true,
        backdropPath: backDropPath,
        id: id,
        name: name,
        title: title,
        overview: '',
        posterPath: posterpath,
        genreIds: [],
        popularity: 0,
        firstAirDate: DateTime.timestamp(),
        voteAverage: 0,
        voteCount: 0);
  }

  @override
  String toString() {
    return 'BookMark{id: $id, title: $title, posterpath: $posterpath, backdrop:$backDropPath}';
  }
}
