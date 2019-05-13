import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: TableDemo(),
  ));
}

class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("表格使用")),
      body: Table(
        columnWidths: const<int, TableColumnWidth> {
          0: FixedColumnWidth(50),
          1: FixedColumnWidth(100),
          2: FixedColumnWidth(50),
          3: FixedColumnWidth(100)
        },
        border: TableBorder.all(color: Colors.red, width: 1, style: BorderStyle.solid),
        children: const <TableRow>[
          TableRow(
          children: <Widget>[
            TextField(maxLines: 3),
            Text('B1'),
            Text('C1'),
            Text('D1'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A2'),
            Text('B2'),
            Text('C2'),
            Text('D2'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A3'),
            Text('B3'),
            Text('C3'),
            Text('D3'),
          ],
        ),
        ],
      ),
    );
  }
}