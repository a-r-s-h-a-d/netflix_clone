import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
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
          image: const DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg'))),
    );
  }
}
