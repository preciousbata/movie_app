import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/widgets/loading_widget_card.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.amber,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const LoadingWidgetCard(),
          separatorBuilder: (_, __) => const SizedBox(
                width: 20,
              ),
          itemCount: 5),
    );
  }
}
