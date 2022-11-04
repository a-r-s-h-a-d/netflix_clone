import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconsize;
  final double textsize;
  const CustomButtonWidget({
    required this.icon,
    required this.title,
    this.iconsize = 25,
    this.textsize = 12,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textsize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
