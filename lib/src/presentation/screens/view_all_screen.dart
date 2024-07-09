import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entity/arguments.dart';
import 'package:movie_app/src/presentation/widgets/movie_list_view.dart';

class ViewAllScreen extends StatelessWidget {
  static String routeName = 'view-all';
  final Arguments arguments;
  const ViewAllScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: Text(arguments.header!),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 3, 10, 0),
          child: MovieListView(
            movies: arguments.movies!,
            scrollDirection: Axis.vertical,
            isHomeScreen: false,
            isTrendingMovies: arguments.isTrendingMovies!,
          ),
        ));
  }
}
