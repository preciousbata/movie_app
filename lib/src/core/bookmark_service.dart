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
  static const String columnPosterPathUrl = 'posterpath';
  static const String columnBackDropUrl = 'backDropPath';

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
            $columnTitle TEXT NOT NULL,
            $columnName TEXT NOT NULL,
            $columnPosterPathUrl TEXT NOT NULL,
            $columnBackDropUrl TEXT NOT NULL
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
        posterpath: maps[i][columnPosterPathUrl],
        backDropPath: maps[i][columnBackDropUrl],
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
