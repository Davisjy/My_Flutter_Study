import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: ExpandDemo(),
  ));
}

class ExpandDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("展开收起"),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text("点我展开"),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text("list"),
              subtitle: Text("sub title"),
            ),
            ExpansionTile(
          title: Text("点我展开"),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text("list"),
              subtitle: Text("sub title"),
            )
          ],
          initiallyExpanded: false,
        )
          ],
          initiallyExpanded: false,
        ),
      ),
    );   
  }
}