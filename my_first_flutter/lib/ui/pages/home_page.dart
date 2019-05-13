import 'package:flutter/material.dart';
import 'package:my_first_flutter/common/component_index.dart';

bool isHomeInit = true;

class HomePage extends StatelessWidget {
  HomePage({Key key, this.labelId}) : super(key: key);

  final String labelId;

  Widget buildBanner(BuildContext context, List<BannerModel> list) {
    if (ObjectUtil.isEmpty(list)) return Container(height: 0.0);
    return AspectRatio(
      aspectRatio: 16/9,
      child: Swiper(
        indicatorAlignment: AlignmentDirectional.topEnd,
        circular: true,
        interval: const Duration(seconds: 5),
        indicator: NumberSwiperIndicator(),
        children: list.map((model) {
          return InkWell(
            onTap: () {
              LogUtil.e("BannerModel:" + model.toString());
            },
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: model.imagePath,
              placeholder: (context, url) => ProgressView(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildRepos(BuildContext context, List<ReposModel> list) {
    if (ObjectUtil.isEmpty(list)) {
      return Container(height: 0.0);
    }

    List<Widget> _children = list.map((model) {
      return ReposItem(model, isHome: true);
    }).toList();

    List<Widget> children = List();
    children.add(HeaderItem(
      leftIcon: Icons.book,
      titleId: Ids.recRepos,
      onTap: () {
        NavigatorUtil.pushTabPage(context,
        labelId: Ids.titleReposTree, titleId: Ids.titleReposTree);
      },
    ));

    children.addAll(_children);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget buildWxArticle(BuildContext context, List<ReposModel> list) {
    if (ObjectUtil.isEmpty(list)) return Container(height: 0.0);
    List<Widget> _children = list.map((model) {
      return ArticleItem(
        model,
        isHome: true,
      );
    }).toList();

    List<Widget> children = List();
    children.add(
      HeaderItem(
        titleColor: Colors.green,
        leftIcon: Icons.library_books,
        titleId: Ids.recWxArticle,
        onTap: () {
          NavigatorUtil.pushTabPage(context,
          labelId: Ids.titleWxArticleTree, titleId: Ids.titleWxArticleTree);
        },
      )
    );
    children.addAll(_children);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e("HomePage build...");
    RefreshController _controller = RefreshController();
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    bloc.homeEventStream.listen((event) {
      if (labelId == event.labelId) {
        _controller.sendBack(false, event.status);
      }
    });

    if (isHomeInit) {
      LogUtil.e("HomePage init...");
      isHomeInit = false;
      Observable.just(1).delay(Duration(milliseconds: 500)).listen((_) {
        bloc.onRefresh(labelId: labelId);
        bloc.getHotRecItem();
        bloc.getVersion();
      });
    }

    return StreamBuilder(
      stream: bloc.bannerStream,
      builder: (BuildContext context, AsyncSnapshot<List<BannerModel>> snapshot) {
        return RefreshScaffold(
          labelId: labelId,
          isLoading: snapshot.data == null,
          controller: _controller,
          enablePullUp: false,
          onRefresh: () {
            return bloc.onRefresh(labelId: labelId);
          },
          child: ListView(
            children: <Widget>[
              StreamBuilder(
                stream: bloc.recItemStream,
                builder: (BuildContext context, AsyncSnapshot<ComModel>snapshot) {
                  ComModel model = bloc.hotRecModel;
                  if (model == null) {
                    return Container(height: 0.0,);
                  }
                  int status = Utils.getUpdateStatus(model.version);
                  return HeaderItem(
                    titleColor: Colors.redAccent,
                    title: status == 0 ? model.content : model.title,
                    extra: status == 0 ? "Go":"",
                    onTap: () {
                      if(status == 0) {
                        // NavigatorUtil.pushPage(context, )
                      } else {
                        NavigatorUtil.launchInBrowser(model.url, title: model.title);
                      }
                    },
                  );
                },
              ),
              buildBanner(context, snapshot.data),
              StreamBuilder(
                stream: bloc.recReposStream,
                builder: (BuildContext context,
                        AsyncSnapshot<List<ReposModel>> snapshot) {
                          return buildRepos(context, snapshot.data);
                        },
              ),
              StreamBuilder(
                stream: bloc.recWxArticleStream,
                builder: (BuildContext context, AsyncSnapshot<List<ReposModel>> snapshot) {
                  return buildWxArticle(context, snapshot.data);
                },
              )
            ],
          ),
        );
      },
    );
  }
}


class NumberSwiperIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(top: 10, right: 5),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Text("${++index}/$itemCount", style: TextStyle(
        color: Colors.white70,
        fontSize: 11.0
      )),
    );
  }
}

