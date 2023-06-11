import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieEntity movie;
  static String routeName = '/movie_detail';

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'http://image.tmdb.org/t/p/w500/${movie.posterPath}',
              ),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                top: 34,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 50,
                          color: Colors.green,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: null,
        label: Row(
          children: const [
            Text(
              'PLAY',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.play_circle_outline_rounded,
              size: 27,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
