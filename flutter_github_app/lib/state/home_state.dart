import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/model/repo.dart';
import 'package:flutter_github_app/net/git.dart';
import 'package:flutter_github_app/net/result_data.dart';

class HomeState {
  int page = 1;
  Future<List<Repo>> fetchData(BuildContext context,bool loadMore) async {
    if (loadMore) {
      page ++;
    } else{
      page = 1;
    }
    String url = "user/repos";
    Map<String,dynamic> params = {"page":page,"page_size":2};
    ResultData resultData = await Git(context).get(url, params, context, false);
    if (resultData.data is List){
      List data = resultData.data;
      List<Repo> list = data.map((e)=> Repo.fromJson(e)).toList();
      return list;
    }
    return [];
  }
}