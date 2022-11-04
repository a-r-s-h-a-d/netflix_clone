import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class EveryonesWidgets extends StatelessWidget {
  const EveryonesWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight,
        const Text(
          'Friends',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        const Text(
          'Six young people from New York City, on their own and struggling to survive in the real world, find the companionship, comfort and support they get from each other to be the perfect antidote to the pressures of life.',
          style: TextStyle(color: kGreyColor, fontSize: 11),
        ),
        kheight50,
        const VideoWidget(),
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
