// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ViewAllMovieCard extends StatelessWidget {
  final String? imageUrl, title;

  const ViewAllMovieCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage('http://image.tmdb.org/t/p/w500/$imageUrl'),
                  fit: BoxFit.cover,
                  colorFilter:
                      const ColorFilter.mode(Colors.black12, BlendMode.darken)),
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                title!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
