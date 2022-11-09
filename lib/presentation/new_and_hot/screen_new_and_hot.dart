import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyoneswatchingwidget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
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
              kwidth,
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kwhiteColor,
              labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              indicator:
                  BoxDecoration(color: kwhiteColor, borderRadius: kBradius30),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(
              key: Key('coming soon'),
            ),
            EveryoneIsWatchingList(
              key: Key('everyone_is_watching'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error while loading coming soon'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('Coming soon list is Empty'),
          );
        } else {
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              final _date = DateTime.parse(movie.releaseDate!);
              final formatedDate = DateFormat.yMMMd('en_us').format(_date);
              return ComingSoonWidget(
                id: movie.id.toString(),
                month: formatedDate.split(' ').first.substring(0, 3),
                day: movie.releaseDate!.split('-')[1],
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No title',
                description: movie.overview ?? 'No description',
              );
            },
          );
        }
      },
    );
  }
}

class EveryoneIsWatchingList extends StatelessWidget {
  const EveryoneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text('Error while loading coming soon'),
          );
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return const Center(
            child: Text('Everyones watching list is Empty'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                // final _date = DateTime.parse(movie.releaseDate!);
                // final formatedDate = DateFormat.yMMMd('en_us').format(_date);

                final tv = state.everyOneIsWatchingList[index];
                return EveryonesWidgets(
                  posterPath: '$imageAppendUrl${tv.posterPath}',
                  movieName: tv.originalTitle ?? 'No name provided',
                  description: tv.overview ?? 'No description',
                );
              },
            ),
          );
        }
      },
    );
  }
}
