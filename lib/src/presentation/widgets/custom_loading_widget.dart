import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/widgets/loading_widget_card.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final bool isBanner;
  const CustomLoadingIndicator({
    super.key,
    required this.isBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      loop: 3,
      highlightColor: Colors.grey.shade100,
      child: isBanner
          ? const SizedBox(
              height: 200,
              child: LoadingBannerWidget(),
            )
          : SizedBox(
              height: 200,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const LoadingWidgetCard(),
                  separatorBuilder: (_, __) => const SizedBox(
                        width: 8,
                      ),
                  itemCount: 5),
            ),
    );
  }
}
