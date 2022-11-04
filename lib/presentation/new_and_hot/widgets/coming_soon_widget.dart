import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 430,
          child: Column(
            children: const [
              Text(
                'FEB',
                style: TextStyle(fontSize: 16, color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 430,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              Row(
                children: [
                  const Text(
                    'The Witcher',
                    style: TextStyle(
                        letterSpacing: -4,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications_none,
                        iconsize: 25,
                        title: 'Remind me',
                        textsize: 10,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        iconsize: 25,
                        title: 'info',
                        textsize: 10,
                      ),
                      kwidth20
                    ],
                  )
                ],
              ),
              const Text(
                'Coming on Friday',
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              const Text(
                'The Witcher',
                style: TextStyle(
                  letterSpacing: -1,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              const Text(
                'Geralt embraces his destiny as he protects Ciri from the forces battling for control of the Continent — and from the mysterious power she possesses.',
                style: TextStyle(color: kGreyColor, fontSize: 11),
              )
            ],
          ),
        ),
      ],
    );
  }
}
