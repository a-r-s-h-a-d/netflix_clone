import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: kBradius10,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/62HCnUTziyWcpDaBO2i1DX17ljH.jpg'))),
            ),
          ],
        ),
        Positioned(
          left: 20,
          bottom: -22,
          child: BorderedText(
            strokeColor: kwhiteColor,
            strokeWidth: 2.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                color: kBlackColor,
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
