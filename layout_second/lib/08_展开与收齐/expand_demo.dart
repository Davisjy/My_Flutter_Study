import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: ExpandDemo(),
  ));
}

class ExpandStateModel {
  var isOpen;
  var index;
  ExpandStateModel(this.isOpen, this.index);
}

class ExpandDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpandDemoState();
  }
}

class _ExpandDemoState extends State<ExpandDemo> {
  var currentIndex = -1;
  List<int> indexList = List();
  List<ExpandStateModel> stateList = List();
  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      indexList.add(i);
      stateList.add(ExpandStateModel(false, i));
    }
    super.initState();
  }

  _setCurrentAction(int index, bool isExpand) {
    setState(() {
      stateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrentAction(index, bol);
          },
          children: stateList.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpand) {
                return ListTile(
                  title: Text("this is no "),
                );
              },
              body: ListTile(
                title: Text("expansion no."),
              ),
              isExpanded: index.isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}