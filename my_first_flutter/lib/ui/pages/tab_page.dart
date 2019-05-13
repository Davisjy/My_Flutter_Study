import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';

class TabPage extends StatefulWidget {
  const TabPage(
      {Key key, this.labelId, this.title, this.titleId, this.treeModel})
      : super(key: key);
  final String labelId;
  final String title;
  final String titleId;
  final TreeModel treeModel;
  @override
  State<StatefulWidget> createState() {
    return TabPageState();
  }
}

class TabPageState extends State<TabPage> {
  List<BlocProvider<ComListBloc>> _children = List();

  @override
  Widget build(BuildContext context) {
    final TabBloc bloc = BlocProvider.of<TabBloc>(context);
    bloc.bindSystemData(widget.treeModel);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.title ?? IntlUtil.getString(context, widget.titleId)
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: bloc.tabTreeStream,
        builder: (BuildContext context, AsyncSnapshot<List<TreeModel>> snapshot) {
          if (snapshot.data == null) {
            Observable.just(1).delay(Duration(milliseconds: 500)).listen((_) {
              bloc.getData(labelId: widget.labelId);
            });
            return ProgressView();
          }
          _children = snapshot.data.map((TreeModel model) {
            return BlocProvider(
              child: ComListPage(
                labelId: widget.labelId,
                cid: model.id,
              ),
              bloc: ComListBloc(),
            );
          }).cast<BlocProvider<ComListBloc>>()
          .toList();
          return DefaultTabController(
            length: snapshot.data == null ? 0 : snapshot.data.length,
            child: Column(
              children: <Widget>[
                Material(
                  color: Theme.of(context).primaryColor,
                  child: SizedBox(
                    height: 48.0,
                    width: double.infinity,
                    child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: snapshot.data?.map((TreeModel model) {
                        return Tab(text: model.name);
                      })?.toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(children: _children),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    for (int i = 0, length = _children.length; i<length; i++) {
      _children[i].bloc.dispose();
    }
    super.dispose();
  }
}