import 'package:flutter/material.dart';

import '../../screens/movie_detail_screen.dart';

class TrendingMovieListTile extends StatelessWidget {
  final String title;
  // final String imageUrl;
  const TrendingMovieListTile({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, MovieDetailScreen.routeName),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image:  DecorationImage(
                image: AssetImage(
                    'assest/images/bg_images.jpg'),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                    Colors.black12,
                    BlendMode.darken)),
            borderRadius:
            BorderRadius.circular(10)),
      ),
      title:  Text(
        title,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Row(children: const [
        Text(
          'Movie Genre',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'Movie Duration',
          style: TextStyle(color: Colors.white),
        )
      ]),
      trailing: Container(
        height: 25,
        width: 25,
        padding: const EdgeInsets.only(top: 3),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.amber),
        child: const Text(
          '1',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
