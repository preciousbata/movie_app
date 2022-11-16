import 'package:movie_app/src/domain/entity/movie_entity.dart';

abstract class UseCases<MovieEntity> {
Future<MovieEntity> call();
}