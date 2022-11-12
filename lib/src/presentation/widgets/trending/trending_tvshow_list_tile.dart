import 'package:flutter/material.dart';

class TrendingTvshowListTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TrendingTvshowListTile({
    Key? key,
    required this.title,
    required this.imageUrl,
    // required this.movieGenre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('http://image.tmdb.org/t/p/w500/$imageUrl'),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                    Colors.black12, BlendMode.darken)),
            borderRadius: BorderRadius.circular(10)),
      ),
      title: Text(
        title,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Row(children: const [
        Text(
          'genre',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          child: Text(
            'Tv show Duration',
            style: TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis),
          ),
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
