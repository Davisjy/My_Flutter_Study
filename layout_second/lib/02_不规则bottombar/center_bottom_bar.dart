import 'package:flutter/material.dart';
import 'parent_view.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      home: BottomAppBarDemo(),
    );
  }
}

class BottomAppBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomAppState();
  }
}

class _BottomAppState extends State<BottomAppBarDemo> {
  List<Widget> list = List();
  int _index = 0;

  @override
  void initState() {

    super.initState();
    list
    ..add(ParentView(title: 'home'))
    ..add(ParentView(title: "aire"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return ParentView(title: "test");
          }));
        },
        tooltip: "增加",
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;                  
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;                  
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}