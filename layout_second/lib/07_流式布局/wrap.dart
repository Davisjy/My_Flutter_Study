import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: WrapDemo(),
  ));
}

class WrapDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WrapDemoState();
  }
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> list;
  @override
  void initState() {

    super.initState();
    list = List<Widget>()..add(buildAddBtn());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("布局"),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddBtn() {
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 80,
        height: 80,
        color: Colors.amber,
        child: Center(
          child: Text("照片"),
        ),
      ),
    );
  }

}