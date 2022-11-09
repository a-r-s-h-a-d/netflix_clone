import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWidgets extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWidgets({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Text(
          description,
          style: const TextStyle(color: kGreyColor, fontSize: 11),
        ),
        kheight50,
        VideoWidget(
          url: posterPath,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.telegram_sharp,
              iconsize: 25,
              title: 'Share',
              textsize: 12,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              iconsize: 25,
              title: 'My List',
              textsize: 12,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              iconsize: 25,
              title: 'Play',
              textsize: 12,
            ),
          ],
        )
      ],
    );
  }
}
