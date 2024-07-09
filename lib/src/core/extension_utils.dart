import 'package:flutter/material.dart';

extension BuildContextWrapper on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  TextTheme get textTheme => Theme.of(this).textTheme;

  void showSnackBar(String errorMessage) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}