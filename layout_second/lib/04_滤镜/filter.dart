import 'package:flutter/material.dart';
import 'dart:ui';

main(List<String> args) {
  runApp(MaterialApp(
    title: "demo",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: FrostedGlass(),
  ));
}


class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg"),
          ),
          Center(child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Center(
                    child: Text("Davis", style: Theme.of(context).textTheme.display3),
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

