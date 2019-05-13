import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      title: "some demo",
      home: Mypage(),
    )
  );
}


class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("发布成功",style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.normal
        )),
        elevation: 0,
        leading: IconButton(
          icon: new Image.asset("assets/images/nav_close.png"),
          onPressed:() {
            Tooltip(message: "点我点我了",child: Icon(Icons.add));
          },
        ),
      ),
      body: PageContent(),
    );
  }
}

class PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 42),
      child: Column(
        children: <Widget>[
          // 第一行
          Row(
            children: <Widget>[
              Container(
                width: 52,
                height: 52,
                margin: const EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar2.png"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, right: 15),
                height: 48,
                child: Stack(
                  children: <Widget>[
                    Image.asset("assets/images/publish_chat_box.png"),
                    Positioned(
                      left: 25,
                      top: 14,
                      child: Text("张老师发布了一个任务，请接收～",
                      style: TextStyle(fontSize: 14,color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          // 中间画板内容
          Container(
            margin: const EdgeInsets.fromLTRB(6, 24, 6, 30),
            child: CenterBoxWidget(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Unit 1 Lesson 3 About animal",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Round",
                        color: Colors.white
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 13),
                      child: Image.asset("assets/images/publish_work_line.png"),
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        WorkTotalItem(title: "课文跟读 12"),
                        WorkTotalItem(title: "课文跟读 12"),
                        WorkTotalItem(title: "课文跟读 12"),
                        WorkTotalItem(title: "课文跟读 12"),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 178),
                      child: Stack(
                        children: <Widget>[
                          Image.asset("assets/images/publish_work_sign.png"),
                          Positioned(
                            left: 4,
                            top: 4,
                            child: Text("预习",style: TextStyle(
                              fontSize: 14,
                              color: Colors.white
                            )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text("明天12:00截止",style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFFFC1C1)
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),

          // 下方的分享
          LineTips(title: "给家长发个通知吧"),
          
          // 下面icon
          Container(
            margin: const EdgeInsets.only(top: 32),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 60,
                  icon: Image.asset("assets/images/share_wechat.png"),
                  onPressed: (){
                    print("微信分享啊");
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 32),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 60,
                    icon: Image.asset("assets/images/share_qq.png"),
                    onPressed: () {
                      print("qq分享");
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class CenterBoxWidget extends StatelessWidget{
  final Widget child;
  CenterBoxWidget({@required this.child});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        color: Color(0xFFF0D5A9),
        padding: const EdgeInsets.all(12),
        child: Container(
          color: const Color(0xFF3C594E),
          child: child,
        ),
      ),
    );
  }
}

class WorkTotalItem extends StatelessWidget {
  final String title;
  WorkTotalItem({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Text(
        "$title",
        style: TextStyle(
          fontSize: 14,
          color: Colors.white
        ),
      ),
    );
  }
}


class LineTips extends StatelessWidget {
  static const defaultMargin  = const EdgeInsets.only(left: 15, right: 15);
  final String title;
  final EdgeInsetsGeometry margin;
  LineTips({this.title, this.margin = defaultMargin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              color: Color(0xFFD4CFE4),
              height: 1.0,
            ),    
          ),
          Text(title, style: TextStyle(fontSize: 14,color: Color(0xFF757085))),
          Expanded(
            child:  Container(
              margin: const EdgeInsets.only(left: 10),
              color: Color(0xFFD4CFE4),
              height: 1.0,
            ),
          )
        ],
      ),
    );
  }
}