import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
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
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 16, color: kGreyColor),
              ),
              Text(
                day,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              VideoWidget(url: posterPath),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          //letterSpacing: -2,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
              Text(
                'Coming on $day $month',
                style: const TextStyle(
                  color: kGreyColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Text(
                movieName,
                style: const TextStyle(
                  letterSpacing: -1,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Text(
                description,
                style: const TextStyle(color: kGreyColor, fontSize: 11),
                maxLines: 4,
              )
            ],
          ),
        ),
      ],
    );
  }
}
