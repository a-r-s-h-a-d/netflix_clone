import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: ' Downloads',
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) => _widgetList[index],
                separatorBuilder: (context, index) => const SizedBox(
                      height: 25,
                    ),
                itemCount: _widgetList.length)));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/2IRjbi9cADuDMKmHdLK7LaqQDKA.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/5dsX6UAHqkQz1kiV8bs8SvjyVNa.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rSq6cq0LCcbro10jbEaPTEb3WmW.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        children: [
          const Text(
            'Introducing Downloads For You',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kwhiteColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          kheight,
          const Text(
            "We will download a personalized selection of\nmovies and shows for you,so there's always something to watch on your\ndevice.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(
            width: size.width,
            height: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: size.width * 0.28,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                DownloadsImageWidget(
                  imageList: imageList[0],
                  margin: const EdgeInsets.only(left: 160, bottom: 15),
                  angle: 15,
                  size: Size(size.width * 0.25, size.width * 0.40),
                ),
                DownloadsImageWidget(
                  imageList: imageList[1],
                  margin: const EdgeInsets.only(right: 150, bottom: 25),
                  angle: -20,
                  size: Size(size.width * 0.25, size.width * 0.38),
                ),
                DownloadsImageWidget(
                  imageList: imageList[2],
                  margin: const EdgeInsets.only(bottom: 0),
                  size: Size(size.width * 0.32, size.width * 0.45),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: kButtonColorBlue,
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set Up',
                  style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        kheight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            color: kwhiteColor,
            onPressed: () {},
            child: const Text(
              'See what you can download',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: Colors.grey,
        ),
        Text(
          '  Smart Downloads',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    this.angle = 0,
    required this.size,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: kBlackColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageList),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
