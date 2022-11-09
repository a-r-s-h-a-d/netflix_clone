import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, Widget? child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  } else if (state.hasError) {
                    return const Center(
                      child: Text(
                        'Error while getting data',
                        style: TextStyle(color: kwhiteColor),
                      ),
                    );
                  }
                  //released pastYear
                  final _releasedPastYear = state.pastYearMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _releasedPastYear.shuffle();
                  //trending
                  final _trending = state.trendingMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _trending.shuffle();
                  final _tenseDramas = state.tenseDramasMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _tenseDramas.shuffle();
                  final _southIndianMovies =
                      state.southIndianMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _southIndianMovies.shuffle();
                  final _top10TvShow = state.trendingMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _top10TvShow.shuffle();
                  return ListView(
                    children: [
                      Column(
                        children: [
                          const BackgroundCard(),
                          MainTitleCard(
                              title: 'Released in the Past Year',
                              posterList: _releasedPastYear.sublist(0, 10)),
                          MainTitleCard(
                            title: 'Trending Now',
                            posterList: _trending.sublist(0, 10),
                          ),
                          NumberTitleCard(
                            posterList: _top10TvShow.sublist(0, 10),
                          ),
                          MainTitleCard(
                              title: 'Tense Dramas',
                              posterList: _tenseDramas.sublist(0, 10)),
                          MainTitleCard(
                              title: 'South Indian Cinema',
                              posterList: _southIndianMovies.sublist(0, 10)),
                        ],
                      ),
                    ],
                  );
                },
              ),
              scrollNotifier.value
                  ? AnimatedContainer(
                      duration: const Duration(microseconds: 1000),
                      margin: const EdgeInsets.only(left: 4, right: 4),
                      height: 80,
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://scontent.fcok8-1.fna.fbcdn.net/v/t1.18169-9/14358687_882906615174521_6974604260197147695_n.png?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=wi_FTuTx9YkAX9aME90&_nc_ht=scontent.fcok8-1.fna&oh=00_AfBzCu7zJtTpn94qT3heiGclCWX2h5NnxHaVJQN51EA5Kg&oe=638C426D',
                                height: 40,
                                width: 40,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                              ),
                              kwidth,
                              Container(
                                height: 28,
                                width: 28,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          kheight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Tv Series',
                                style: kHomeTitleText,
                              ),
                              Text(
                                'Movies',
                                style: kHomeTitleText,
                              ),
                              Text(
                                'Categories',
                                style: kHomeTitleText,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : kheight,
            ],
          ),
        );
      },
    ));
  }
}
