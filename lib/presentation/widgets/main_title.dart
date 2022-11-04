import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
