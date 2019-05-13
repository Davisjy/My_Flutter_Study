import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: BackDemo(),
  ));
}

class BackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("data"),
      ),
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) {
                  return BackDemo();
                })
              );
            },
          ),
        ),
      ),
    );
  }
}