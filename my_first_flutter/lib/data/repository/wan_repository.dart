import 'package:my_first_flutter/common/common.dart';
import 'package:my_first_flutter/data/api/apis.dart';
import 'package:my_first_flutter/data/net/dio_util.dart';
import 'package:my_first_flutter/data/protocol/models.dart';

class WanRepository {
  Future<List<BannerModel>> getBanner() async {
    BaseResp<List> baseResp = await DioUtil().request(Method.get, WanAndroidApi.getPath(path: WanAndroidApi.BNANNER));
    List<BannerModel> bannerList;
    if (baseResp.code != Constant.status_success) {
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      bannerList = baseResp.data.map((value) {
        return BannerModel.fromJson(value);
      }).toList();
    }
    return bannerList;
  }


  Future<List<ReposModel>> getArticleListProject(int page) async {
  BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
  .request<Map<String, dynamic>>(Method.get, WanAndroidApi.getPath(path: WanAndroidApi.ARICLE_LISTPROJECT, page: page));
  List<ReposModel> list;
  if (baseResp.code != Constant.status_success) {
    return Future.error(baseResp.msg);
  }
  if (baseResp.data != null) {
    ComData comData = ComData.fromJson(baseResp.data);
    list = comData.datas.map((value) {
      return ReposModel.fromJson(value);
    }).toList();
  }
  return list;
}

Future<List<ReposModel>> getArticleList({int page, data}) async {
  BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
  .request<Map<String, dynamic>>(Method.get, WanAndroidApi.getPath(path: WanAndroidApi.ARTICLE_LIST, page: page));
  List<ReposModel> list;
  if (baseResp.code != Constant.status_success) {
    return Future.error(baseResp.msg);
  }
  if (baseResp.data != null) {
    ComData comData = ComData.fromJson(baseResp.data);
    list = comData.datas.map((value) {
      return ReposModel.fromJson(value);
    }).toList();
  }
  return list;
}

Future<List<TreeModel>> getTree() async {
  BaseResp<List> baseResp = await DioUtil().request(Method.get, 
  WanAndroidApi.getPath(path: WanAndroidApi.TREE));
  List<TreeModel> treeList;
  if (baseResp.code != Constant.status_success) {
    return Future.error(baseResp.msg);
  }
  if (baseResp.data != null) {
    treeList = baseResp.data.map((value) => TreeModel.fromJson(value)).toList();
  }
  return treeList;
}

Future<List<ReposModel>> getProjectList({int page: 1, data}) async {
  BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
        .request<Map<String, dynamic>>(Method.get,
            WanAndroidApi.getPath(path: WanAndroidApi.PROJECT_LIST, page: page),
            data: data);
  List<ReposModel> list;
  if (baseResp.code != Constant.status_success) {
    return new Future.error(baseResp.msg);
  }
  if (baseResp.data != null) {
    ComData comData = ComData.fromJson(baseResp.data);
    list = comData.datas.map((value) {
      return ReposModel.fromJson(value);
    }).toList();
  }
  return list;
}

Future<List<ReposModel>> getWxArticleList({int id, int page: 1, data}) async {
  BaseResp<Map<String, dynamic>> baseResp = await DioUtil()
      .request<Map<String, dynamic>>(
          Method.get,
          WanAndroidApi.getPath(
              path: WanAndroidApi.WXARTICLE_LIST + '/$id', page: page),
          data: data);
  List<ReposModel> list;
  if (baseResp.code != Constant.status_success) {
    return new Future.error(baseResp.msg);
  }
  if (baseResp.data != null) {
    ComData comData = ComData.fromJson(baseResp.data);
    list = comData.datas.map((value) {
      return ReposModel.fromJson(value);
    }).toList();
  }
  return list;
}

Future<List<TreeModel>> getWxArticleChapters() async {
  BaseResp<List> baseResp = await DioUtil().request<List>(Method.get,
      WanAndroidApi.getPath(path: WanAndroidApi.WXARTICLE_CHAPTERS));
  List<TreeModel> treeList;
  if (baseResp.code != Constant.status_success) {
    return new Future.error(baseResp.msg);
  }
  if (baseResp.data != null) {
    treeList = baseResp.data.map((value) {
       return TreeModel.fromJson(value);
    }).toList();
  }
  return treeList;
}

Future<List<TreeModel>> getProjectTree() async {
  BaseResp<List> baseResp = await DioUtil().request<List>(
      Method.get, WanAndroidApi.getPath(path: WanAndroidApi.PROJECT_TREE));
  List<TreeModel> treeList;
  if (baseResp.code != Constant.status_success) {
    return new Future.error(baseResp.msg);
  }
  if (baseResp.data != null) {
    treeList = baseResp.data.map((value) {
      return TreeModel.fromJson(value);
    }).toList();
  }
  return treeList;
}
}


