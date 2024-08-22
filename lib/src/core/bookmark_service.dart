import 'package:movie_app/src/domain/entity/bookmark.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String tableName = 'bookmarks';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnName = 'name';
  static const String columnPosterPathUrl = 'posterPath';
  static const String columnBackDropUrl = 'backDropPath';
  static const String columnAdult = 'adult';
  static const String columnOverview = 'overview';
  static const String columnFirstAirDate = 'firstAirDate';
  static const String columnVoteAverage = 'voteAverage';
  static const String columnVoteCount = 'voteCount';
  static const String columnGenreIds = 'genreIds';
  static const String columnPopularity = 'popularity';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    // Get a location using path_provider
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'bookmarks.db');

    // Open/create the database at a given path
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT,
            $columnName TEXT,
            $columnPosterPathUrl TEXT,
            $columnAdult INTEGER,
            $columnOverview TEXT,
            $columnFirstAirDate TEXT,
            $columnVoteAverage REAL,
            $columnVoteCount INTEGER,
            $columnGenreIds TEXT,
            $columnPopularity REAL,
            $columnBackDropUrl TEXT
          )
        ''');
    });
  }

  Future<int> insertBookmark(BookMark bookmark) async {
    Database db = await database;
    return await db.insert(tableName, bookmark.toMap());
  }

  Future<List<BookMark>> getBookmarks() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return BookMark(
        id: maps[i][columnId],
        title: maps[i][columnTitle],
        name: maps[i][columnName],
        posterPath: maps[i][columnPosterPathUrl],
        backdropPath: maps[i][columnBackDropUrl],
        adult: maps[i][columnAdult] == 1, // Convert int to bool
        voteAverage: maps[i][columnVoteAverage],
        voteCount: maps[i][columnVoteCount],
        popularity: maps[i][columnPopularity],
        genreIds: (maps[i][columnGenreIds] as String)
            .split(',')
            .map((e) => int.parse(e))
            .toList(), // Convert comma-separated String to List<int>
        firstAirDate: DateTime.parse(
            maps[i][columnFirstAirDate]), // Convert String to DateTime
        overview: maps[i][columnOverview],
      );
    });
  }

  Future<int> updateBookmark(MovieEntity movie) async {
    Database db = await database;
    return await db.update(
      tableName,
      movie.toMap(),
      where: '$columnId = ?',
      whereArgs: [movie.id],
    );
  }

  Future<int> deleteBookmark(int id) async {
    Database db = await database;
    return await db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<bool> isMovieBookmarked(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'bookmarks',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}
