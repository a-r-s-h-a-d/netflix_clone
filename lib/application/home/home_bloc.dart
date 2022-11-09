import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    //on event get homescreen data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to ui

      emit(state.copyWith(isLoading: true, hasError: false));

      //get Data
      final _movieResult = await _homeService.getHotAndNewMovieData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      //transform Data

      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          pastYear.shuffle();
          final trending = resp.results;
          trending.shuffle();
          final dramas = resp.results;
          dramas.shuffle();
          final southIndian = resp.results;
          southIndian.shuffle();
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramasMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );

      emit(_state1);

      final _state2 = _tvResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: top10List,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );

      //send to ui
      emit(_state2);
    });
  }
}
