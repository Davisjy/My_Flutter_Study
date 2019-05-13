import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';
import 'package:my_first_flutter/ui/pages/page_index.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);

    ComModel github = new ComModel(
        title: 'GitHub',
        url: 'https://github.com/Sky24n/flutter_wanandroid',
        extra: 'Go Star');
    ComModel author = new ComModel(title: '作者', page: SettingPage());
    ComModel other = new ComModel(title: '其他', page: SettingPage());

    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.titleAbout)),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 160,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Image.asset(Utils.getImgPath("ic_launcher_news"),
                    width: 72,
                    height: 72,
                    fit: BoxFit.fill,
                  ),
                ),
                Gaps.vGap5,
                Text("版本号 " + AppConfig.version,
                style: TextStyle(color: Colours.gray_99, fontSize: 14),)
              ],
            ),
            decoration: Decorations.bottom,
          ),
          ComArrowItem(github),
          ComArrowItem(author),
          StreamBuilder(
            stream: bloc.versionStream,
            builder: (BuildContext context, AsyncSnapshot<VersionModel> snapshot) {
              VersionModel model = snapshot.data;
              return Container(
                child: Material(
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      if (model == null) {
                        bloc.getVersion();
                      } else {
                        if (Utils.getUpdateStatus(model.version) != 0) {
                          NavigatorUtil.launchInBrowser(model.url, title: model.title);
                        }
                      }
                    },
                    title: Text("版本更新"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(model == null ? "" :
                        (Utils.getUpdateStatus(model.version) == 0
                                    ? '已是最新版'
                                    : '有新版本，去更新吧'), style: TextStyle(
                                color: (model != null &&
                                        Utils.getUpdateStatus(model.version) !=
                                            0)
                                    ? Colors.red
                                    : Colors.grey,
                                fontSize: 14.0),),
                        Icon(Icons.navigate_next, color:Colors.grey)
                      ],
                    ),
                  ),
                ),
                decoration: Decorations.bottom,
              );
            },
          ),
          ComArrowItem(other),
        ],
      ),
    );
  }
}