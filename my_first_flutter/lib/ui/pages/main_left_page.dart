import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';
import 'package:my_first_flutter/ui/pages/page_index.dart';

class PageInfo {
  const PageInfo({this.titleId, this.iconData, this.page, this.withScaffold=true});

  final String titleId;
  final IconData iconData;
  final Widget page;
  final withScaffold;
}

class MainLeftPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainLeftPage();
  }
}

class _MainLeftPage extends State<MainLeftPage> {
  List<PageInfo> _pageInfo = List();

  @override
  void initState() {
    super.initState();
    _pageInfo.add(PageInfo(titleId: Ids.titleCollection, iconData: Icons.collections, page: AboutPage()));
    _pageInfo.add(PageInfo(titleId: Ids.titleSetting, iconData: Icons.settings, page: SettingPage()));
    _pageInfo.add(PageInfo(titleId: Ids.titleAbout, iconData: Icons.info, page: AboutPage()));
    _pageInfo.add(PageInfo(titleId: Ids.titleShare, iconData: Icons.share, page: AboutPage()));
    _pageInfo.add(PageInfo(titleId: Ids.titleSignOut, iconData: Icons.power_settings_new, page: AboutPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().statusBarHeight, left: 10),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 64,
                        height: 64,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              Utils.getImgPath("ali_connors"),
                            )
                          )
                        ),
                      ),
                      Text("Davis",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
                      ),
                      Text("加油加油", style: TextStyle(
                        color: Colors.white,
                        fontSize: 10
                      ),)
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white,),
                      iconSize: 18,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0.0),
              itemCount: _pageInfo.length,
              itemBuilder: (BuildContext context, int index) {
                PageInfo pageInfo = _pageInfo[index];
                return ListTile(
                  leading: Icon(pageInfo.iconData),
                  title: Text(IntlUtil.getString(context, pageInfo.titleId)),
                  onTap: () {
                    if (pageInfo.titleId != Ids.titleSignOut) {
                      NavigatorUtil.pushPage(context, pageInfo.page,pageName: pageInfo.titleId);
                    }
                  },
                  trailing: Icon(Icons.keyboard_arrow_right),
                );
              },
            ),
            flex: 1,
          )
        ],
      ),
    );   
  }
}