import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    new MaterialApp(
      title: "route",
      home: OnePage(),
    )
  );
}

class OnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("one", style: TextStyle(fontSize: 20)),
        // 设置导航栏融合度
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).push(
              CustomeRute(SecondPage())
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second"),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color:Colors.white,
            size:64.0
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class CustomeRute extends PageRouteBuilder {
  final Widget widget;
  CustomeRute(this.widget):
  super(
    transitionDuration: const Duration(seconds: 1),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2) {
        return widget;
      },
    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child) {
        return FadeTransition(
          opacity: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
      },
  );
}

// 缩放路由动画
// return ScaleTransition(
//   scale:Tween(begin:0.0,end:1.0).animate(CurvedAnimation(
//     parent:animation1,
//     curve: Curves.fastOutSlowIn
//     )),
//     child:child
// );


// 旋转+缩放动画
// return RotationTransition(
//   turns:Tween(begin:0.0,end:1.0)
//   .animate(CurvedAnimation(
//     parent: animation1,
//     curve: Curves.fastOutSlowIn
//   )),
//   child:ScaleTransition(
//     scale:Tween(begin: 0.0,end:1.0)
//     .animate(CurvedAnimation(
//         parent: animation1,
//         curve:Curves.fastOutSlowIn
//     )),
//     child: child,
//   )
// );

// 幻灯片路由动画
// return SlideTransition(
//   position: Tween<Offset>(
//     begin: Offset(-1.0, 0.0),
//     end:Offset(0.0, 0.0)
//   )
//   .animate(CurvedAnimation(
//     parent: animation1,
//     curve: Curves.fastOutSlowIn
//   )),
//   child: child,
// );