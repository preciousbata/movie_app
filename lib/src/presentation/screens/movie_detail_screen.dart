import 'package:flutter/material.dart';

import '../widgets/background_image.dart';

class MovieDetailScreen extends StatelessWidget {
  static String routeName = '/movie_detail';

  const MovieDetailScreen({Key? key}) : super(key: key);

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
                height: 500,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/container_bg.jpg'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black12, BlendMode.darken)),
                  borderRadius: BorderRadius.only(
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
              const Text(
                'Movie Title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Flexible(
                child: Text(
                  'Movie Summary',
                  style: TextStyle(
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
