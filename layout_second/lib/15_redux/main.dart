import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:layout_second/15_redux/state/count_state.dart';
import 'package:redux/redux.dart';

main(List<String> args) {
  final store = Store<CountState>(reducer, initialState: CountState.initState());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store <CountState> store;
  MyApp(this.store);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: FirstPage(),
      ),
    );
  }
}


class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstState();    
  }
}

class _FirstState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Center(
        child: StoreConnector<CountState, int>(
          converter: (store) => store.state.count,
          builder: (context, count) {
            return Text(count.toString(), style:Theme.of(context).textTheme.display1 );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return SecondPage();
          }));
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}


class SecondPage extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {
    return _SecondState();
  }
}

class _SecondState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("second page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hhh"),
            StoreConnector<CountState,int>(
              converter: (store)=> store.state.count,
              builder: (context, count) {
                return Text(count.toString(),
                style: Theme.of(context).textTheme.display1);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState, VoidCallback>(
        converter: (store) {
          return ()=> store.dispatch(Action.increment);
        },
        builder: (context, callback) {
          return FloatingActionButton(onPressed: callback,
          child: Icon(Icons.add));
        },
      ),
    );   
  }
}