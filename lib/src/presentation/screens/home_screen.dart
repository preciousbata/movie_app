import 'package:flutter/material.dart';

import '../widgets/background_image.dart';
import '../widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackGroundImage(
          imageUrl: 'asset/images/bg_image.jpg',
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(child: HomeScreenBody()),
        )
      ],
    );
  }
}
