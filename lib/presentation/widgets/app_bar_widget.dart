import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          height: 28,
          width: 28,
          color: Colors.blue,
        ),
        kwidth,
      ],
    );
  }
}
