import 'package:flutter/material.dart';
import 'home.dart';
import 'page.dart';
import 'email.dart';
import 'airplane.dart';

void main(List<String> args) {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hh",
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigationWidget> {
  final _navigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
    ..add(Home())
    ..add(Email())
    ..add(Page())
    ..add(AirPlane());
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
             Icons.home,
             color: _navigationColor, 
            ),
            title: Text(
              "home",
              style: TextStyle(color: _navigationColor),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
             Icons.email,
             color: _navigationColor, 
            ),
            title: Text(
              "email",
              style: TextStyle(color: _navigationColor),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
             Icons.pages,
             color: _navigationColor, 
            ),
            title: Text(
              "pages",
              style: TextStyle(color: _navigationColor),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
             Icons.airplay,
             color: _navigationColor, 
            ),
            title: Text(
              "airplay",
              style: TextStyle(color: _navigationColor),
            )
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}