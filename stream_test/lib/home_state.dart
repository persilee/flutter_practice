class HomeState{}

class InitialzedHomeState extends HomeState {}

class DataFecthedHomeState extends HomeState {
  final List<String> data;

  DataFecthedHomeState({this.data});

  bool get hasData => data.length > 0;
}

class ErrorHomeState extends HomeState{}

class BusyHomeState extends HomeState{}

