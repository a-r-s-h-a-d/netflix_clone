import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 650,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(kMainImage),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
              ),
              playButton(),
              const CustomButtonWidget(
                icon: Icons.info_outline,
                title: 'info',
              ),
            ],
          ),
        )
      ],
    );
  }

  TextButton playButton() {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhiteColor)),
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Text(
          'Play',
          style: TextStyle(
            fontSize: 16,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
