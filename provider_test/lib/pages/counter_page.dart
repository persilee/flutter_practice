import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/model/counter_model.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('second screen rebuild');

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Consumer2<CounterModel,int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
          child: Text(
            '${counter.value}',
            style: TextStyle(fontSize: textSize.toDouble()),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
