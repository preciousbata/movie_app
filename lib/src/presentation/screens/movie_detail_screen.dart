import 'package:flutter/material.dart';
import 'package:movie_app/src/domain/entity/movie_entity.dart';

import '../widgets/background_image.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieEntity movie;
  static String routeName = '/movie_detail';

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundImage(
          imageUrl: 'asset/images/bg_image.jpg',
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                height: 510,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('http://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                      fit: BoxFit.cover,
                      colorFilter:
                          const ColorFilter.mode(Colors.black12, BlendMode.darken)),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    SafeArea(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            color: Colors.white,
                            icon: const Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               Flexible(
                child: Text(
                  movie.overview,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white),
                ),
              ),
            ],
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }
}
