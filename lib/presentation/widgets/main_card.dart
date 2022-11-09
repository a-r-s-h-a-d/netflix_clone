import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 200,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: kBradius20,
          image: DecorationImage(image: NetworkImage(imageUrl))),
    );
  }
}
