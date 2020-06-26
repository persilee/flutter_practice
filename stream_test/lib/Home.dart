
import 'package:flutter/material.dart';
import 'package:provider_test/home_event.dart';
import 'package:provider_test/home_model.dart';
import 'package:provider_test/home_state.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final model = HomeModel();

  @override
  void initState() {
    model.dispatch(FetchData(hasData: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.dispatch(FetchData());
        },
      ),
      body: StreamBuilder(
        stream: model.homeState,
        builder: (buildContext, snapshot) {
          if (snapshot.hasError) {
            return _getInformationMessage(snapshot.error);
          }

          var homeState = snapshot.data;

          if (!snapshot.hasData || homeState is BusyHomeState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (homeState is DataFecthedHomeState) {
            if(!homeState.hasData) {
              return _getInformationMessage('not found data');
            }
          }
          return ListView.builder(
            itemCount: homeState.data.length,
            itemBuilder: (buildContext, index) =>
                _getListItem(index, homeState.data),
          );
        },
      ),
    );
  }

  Widget _getListItem(int index, List<String> listItems) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 66.0,
      color: Colors.grey,
      child: Text(listItems[index]),
    );
  }



  Widget _getInformationMessage(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
            color: Colors.grey[500]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
