import 'package:flutter/material.dart';
class ParentView extends StatefulWidget {
  ParentView({Key key, this.title}): super(key:key);
  String title;  
  @override
  State<StatefulWidget> createState() {
    return new _ParentViewState();
  }
}

class _ParentViewState extends State<ParentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text(widget.title)),
    );
  }
}