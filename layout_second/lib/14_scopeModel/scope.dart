import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:layout_second/14_scopeModel/model/count_model.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CountModel countModel = CountModel(); 
  
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
      model: countModel,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TopScreen(),
      ),
    );
  }
}

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {

  //静态获取model用法实例
  Model getModel(BuildContext context){
    //直接使用of
    final countModel = ScopedModel.of<CountModel>(context);
    //使用CountModel中重写的of
    final countModel2 = CountModel().of(context);

    countModel.increment();
    countModel2.increment();
    return countModel;
    //    return countMode2;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context,child,model){
        return Scaffold(
          appBar: AppBar(
            title: Text('Top Screen'),
          ),
          body: Center(
            child: Text(
              model.count.toString(),
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return SecondePage(title: "Under Screen",);
              }));
            },
            child: Icon(Icons.forward),
          ),
        );
      },
    );
  }

}


class SecondePage extends StatefulWidget {
  SecondePage({Key key, this.title}): super(key:key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return _SecondState();
  }
}

class _SecondState extends State<SecondePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      rebuildOnChange: true,
      builder: (context, child, model) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("hhhh", style: TextStyle(fontSize: 20)),
                Text("${model.count}", style: TextStyle(fontSize: 36),)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.increment();
            },
            tooltip: "hh",
            child: Icon(Icons.add),
          ),
        );
      },

    );
  }
}