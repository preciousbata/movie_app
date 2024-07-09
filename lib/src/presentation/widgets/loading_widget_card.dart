import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';

class LoadingWidgetCard extends StatelessWidget {
  const LoadingWidgetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Skeleton(
      height: 120,
      width: 166,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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

class LoadingBannerWidget extends StatelessWidget {
  const LoadingBannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Skeleton(
            child: null,
            height: 20,
            width: 90,
          ),
          SizedBox(
            width: 12,
          ),
          Skeleton(
            child: null,
            height: 20,
            width: 90,
          ),
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
        color: Colors.black.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
