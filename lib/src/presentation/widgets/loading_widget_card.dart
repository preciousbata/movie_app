import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';

class LoadingWidgetCard extends StatelessWidget {
  const LoadingWidgetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      height: 200,
      width: 166,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Skeleton(
                child: null,
                height: 20,
                width: 90,
              )),
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width, required this.child})
      : super(key: key);

  final double? height, width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
