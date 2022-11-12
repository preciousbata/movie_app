import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const BackGroundImage(
      {super.key,
      required this.imageUrl,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.black, Colors.black12],
              begin: Alignment.bottomCenter,
              end: Alignment.center)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                    Colors.black26, BlendMode.darken)),
          )),
    );
  }
}
