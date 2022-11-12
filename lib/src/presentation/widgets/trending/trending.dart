import 'package:flutter/material.dart';

import 'custom_trending_tabbar.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Trending',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomTrendingTabBar(),
      ],
    );
  }
}
