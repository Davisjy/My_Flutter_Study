import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    title: "demo",
    home: KeepAlive(),
  ));
}

class KeepAlive extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _KeepAliveState();
  }
}

class _KeepAliveState extends State<KeepAlive> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("keep live"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyPage(),
          MyPage(),
          MyPage()
        ],
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageSatae();
  }
}

class _MyPageSatae extends State<MyPage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  bool get wantKeepAlive => true;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("点我点我啊"),
            Text("$_counter", style: Theme.of(context).textTheme.display1)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: "add",
        child: Icon(Icons.add),
      ),
    );
  }
}