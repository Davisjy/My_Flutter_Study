import 'package:flutter/material.dart';
import 'blck_increment.dart';
import 'bloc_base.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BlockProvider(
        child: OnePage(),
        bloc: IncrementBloc(),
      ),
    );
  }
}


class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlockProvider.of<IncrementBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("hh")),
      body: Center(
        child: StreamBuilder(
          stream: bloc.outCounter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text("click ${snapshot.data}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.increamentCounter();
        },
      ),
    );
  }
}