import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("搜搜"),),
      body: ProgressView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){},
      ),
    );
  }
}