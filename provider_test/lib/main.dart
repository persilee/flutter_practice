import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/model/counter_model.dart';
import 'package:provider_test/pages/goods_list_page.dart';
import 'package:provider_test/pages/home_page.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(
    Provider<int>.value(
      value: textSize,
      child: ChangeNotifierProvider.value(
        value: counter,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Dome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouterWidget(),
    );
  }
}

class RouterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Counter'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: 'Home Page'))),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            title: Text('Goods'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GoodsListPage())),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}


