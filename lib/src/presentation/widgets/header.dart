import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final double rightPadding;
  final void Function()? onTap;
  const Header({
    super.key,
    required this.title,
    required this.rightPadding,
    required this.onTap,
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
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: const Text(
            'View all',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 16),
          ),
        )
      ],
    );
  }
}
