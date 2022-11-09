import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String? url;
  const VideoWidget({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              url.toString(),
              fit: BoxFit.fill,
            )),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: kBlackColor.withOpacity(0.5),
            radius: 19,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kwhiteColor,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
