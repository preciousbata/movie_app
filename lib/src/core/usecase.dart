import 'package:equatable/equatable.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';

abstract class UseCases<MovieEntity, Params> {
Future<MovieEntity> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
