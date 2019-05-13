import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';

typedef void OnLoadMore(bool up);

class RefreshScaffold extends StatefulWidget {
  const RefreshScaffold(
      {Key key,
      this.labelId,
      this.isLoading,
      @required this.controller,
      this.enablePullUp: true,
      this.onRefresh,
      this.onLoadMore,
      this.child,
      this.itemCount,
      this.itemBuilder})
      : super(key: key);

  final String labelId;
  final bool isLoading;
  final RefreshController controller;
  final bool enablePullUp;
  final RefreshCallback onRefresh;
  final OnLoadMore onLoadMore;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  State<StatefulWidget> createState() {
    return new RefreshScaffoldState();
  }
}

///   with AutomaticKeepAliveClientMixin
class RefreshScaffoldState extends State<RefreshScaffold>
    with AutomaticKeepAliveClientMixin {
  bool isShowFloatBtn = false;

  @override
  void initState() {
    super.initState();
//    LogUtil.e("RefreshScaffold initState......" + widget.labelId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.scrollController.addListener(() {
        int offset = widget.controller.scrollController.offset.toInt();
        if (offset < 480 && isShowFloatBtn) {
          isShowFloatBtn = false;
          setState(() {});
        } else if (offset > 480 && !isShowFloatBtn) {
          isShowFloatBtn = true;
          setState(() {});
        }
      });
    });
  }

  Widget buildFloatingActionButton() {
    if (widget.controller.scrollController == null ||
        widget.controller.scrollController.offset < 480) {
      return null;
    }

    return new FloatingActionButton(
        heroTag: widget.labelId,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.keyboard_arrow_up,
        ),
        onPressed: () {
          //_controller.scrollTo(0.0);
          widget.controller.scrollController.animateTo(0.0,
              duration: new Duration(milliseconds: 300), curve: Curves.linear);
        });
  }

  @override
  Widget build(BuildContext context) {
//    LogUtil.e("RefreshScaffold build...... " + widget.labelId);
    super.build(context);
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new RefreshIndicator(
                child: new SmartRefresher(
                    controller: widget.controller,
                    enablePullDown: false,
                    enablePullUp: widget.enablePullUp,
                    enableOverScroll: false,
                    onRefresh: widget.onLoadMore,
                    child: widget.child ??
                        new ListView.builder(
                          itemCount: widget.itemCount,
                          itemBuilder: widget.itemBuilder,
                        )),
                onRefresh: widget.onRefresh),
            new Offstage(
              offstage: widget.isLoading != true,
              child: new Container(
                alignment: Alignment.center,
                color: Colours.gray_f0,
                child: new ProgressView(),
              ),
            )
          ],
        ),
        floatingActionButton: buildFloatingActionButton());
  }

  @override
  bool get wantKeepAlive => true;
}
