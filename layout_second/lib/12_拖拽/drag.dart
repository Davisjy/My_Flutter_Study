import 'package:flutter/material.dart';
// https://jspang.com/posts/2019/02/22/flutterdemo.html#第17节：打开应用的闪屏动画案例
main(List<String> args) {
  runApp(MaterialApp(
    home: DragDemo(),
  ));
}

class DragDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragDemo();
  }
}

class _DragDemo extends State<DragDemo> {
  Color _draggbleColor = Colors.grey;

  @override
  void initState() {
    print("init");
    super.initState();
  }

  _addAction() {
    setState(() {
      
    });
  }

  @override
  void didChangeDependencies() {
    print("看看");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MyDragWidget(
            offset: Offset(80, 80),
            widgetColor: Colors.tealAccent,
          ),
          MyDragWidget(
            offset: Offset(180, 80),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color) => _draggbleColor = color,
              builder: (context, condidateData, rejectedData) {
                return Container(
                  width: 200,
                  height: 200,
                  color: _draggbleColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyDragWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;
  MyDragWidget({Key key, this.offset, this.widgetColor}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _MyDrapState();
  }
}

class _MyDrapState extends State<MyDragWidget> {
  Offset offset = Offset(0, 0);
  @override
  void initState() {
    offset = widget.offset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset){
         setState(() {
            this.offset = offset;
         });
       },
      ),
    );   
  }
}