import 'dart:collection';

import 'package:my_first_flutter/common/component_index.dart';
import 'package:my_first_flutter/data/repository/wan_repository.dart';


class TabBloc implements BlocBase {
  BehaviorSubject<List<TreeModel>> _tabTree = BehaviorSubject<List<TreeModel>>();

  Sink<List<TreeModel>> get _tabTreeSink => _tabTree.sink;

  Stream<List<TreeModel>> get tabTreeStream => _tabTree.stream;

  List<TreeModel> treeList;

  WanRepository wanRepository = WanRepository();

  @override
  Future getData({String labelId, int page}) {
    switch (labelId) {
      case Ids.titleReposTree:
        return getProjectTree(labelId);
        break;
      case Ids.titleWxArticleTree:
        return getWxArticleTree(labelId);
        break;
      case Ids.titleSystemTree:
        return getSystemTree(labelId);
        break;
      default:
        return Future.delayed(Duration(seconds: 1));
        break;
    }
  }

  

  Future getProjectTree(String labelId) {
    return wanRepository.getProjectTree().then((list) {
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(list));
    });
  }

  Future getWxArticleTree(String labelId) {
    return wanRepository.getWxArticleChapters().then((list) {
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(list));
    });
  }

  Future getSystemTree(String labelId) {
    return Future.delayed(Duration(milliseconds: 500)).then((_) {
      _tabTreeSink.add(UnmodifiableListView<TreeModel>(treeList));
    });
  }

  Future getTree(String labelId) {
    return wanRepository.getProjectTree().then((list) {
      if (treeList == null) {
        treeList = List();
      }
      treeList.clear();
      treeList.addAll(list);
      _tabTreeSink.add(UnmodifiableListView(treeList));
    });
  }

  void bindSystemData(TreeModel model) {
    if (model == null) return;
    treeList = model.children;
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return getData(labelId: labelId);
  }

  @override
  void dispose() {
    _tabTree.close();
  }
}