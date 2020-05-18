import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_github_app/generated/l10n.dart';
import 'package:flutter_github_app/model/repo.dart';
import 'package:flutter_github_app/state/home_state.dart';
import 'package:flutter_github_app/widgets/repo_item.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final HomeState _homeState = HomeState();
  List<Repo> _list = [];

  @override
  void initState() {
    super.initState();
    if (_list.length <= 0){
      _fetchData(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(S.of(context).home),
      ),
      body: _getList(),
    );
  }

  Widget _getList() {
    if (_list.length > 0 )
      return EasyRefresh(
        child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (BuildContext context, int index){
              return RepoItem(_list[index]);
            }),
        onRefresh: () async {
          _fetchData(context);},
        onLoad: () async {
          _fetchData(context,loadMore: true);
        },
      );
    else{
      return Center(
          child: CupertinoActivityIndicator(
            radius: 10,
          ));
    }
  }
  //获取数据
  _fetchData(BuildContext context,{bool loadMore = false}) async {
    List<Repo> list = await _homeState.fetchData(context, loadMore);
    if (loadMore){
      setState(() {
        _list.addAll(list);
      });
    } else{
      setState(() {
        _list.clear();
        _list.addAll(list);
      });
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
