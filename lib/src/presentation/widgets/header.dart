import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final double rightPadding;
  const Header({
    super.key,
    required this.title,
    required this.rightPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, right: rightPadding),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          'View all',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
        )
      ],
    );
  }
}
