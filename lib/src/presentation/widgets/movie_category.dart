import 'package:flutter/material.dart';

class MovieCategories extends StatelessWidget {
  const MovieCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding:
                    EdgeInsets.only(left: 8, right: 155),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'View all',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              )
            ],
          ),
          SizedBox(
            height: 70,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(
                      width: 20,
                    ),
                itemBuilder: (content, int index) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration:  const BoxDecoration(
                        image:  DecorationImage(
                            image: AssetImage(
                                'asset/images/bg_image.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black12,
                                BlendMode.darken)),
                        shape: BoxShape.circle),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
