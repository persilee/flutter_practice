import 'dart:async';
import 'dart:math';

import 'package:provider_test/home_state.dart';

import 'home_event.dart';

enum HomeViewState { Busy, DataRetrieved, NoData }

class HomeModel {
  final StreamController<HomeState> _stateController = StreamController<HomeState>();

  List<String> _listItems;

  Stream<HomeState> get homeState => _stateController.stream;

  void dispatch(HomeEvent event){
    print('Event dispatched: $event');
    if(event is FetchData) {
      _getListData(hasData: event.hasData, hasError: event.hasError);
    }
  }

  Future _getListData({bool hasError = false, bool hasData = true}) async {
    _stateController.add(BusyHomeState());
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return _stateController.addError('error');
    }

    if (!hasData) {
      return _stateController.add(DataFecthedHomeState(data: List<String>()));
    }

    _listItems = List<String>.generate(10, (index) => '$index title');
    _stateController.add(DataFecthedHomeState(data: _listItems));
  }
}
