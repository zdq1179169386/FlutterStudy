import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';


class RefreshPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('RefreshPage'),
      ),
      body: new RefreshPageBody(),
    );
  }
}

class RefreshPageBody extends StatefulWidget {
  @override
  _RefreshPageBodyState createState() {
    return _RefreshPageBodyState();
  }
}

class _RefreshPageBodyState extends State<RefreshPageBody> {
  List<String> _listViewArray = [];
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();
  bool _loadMore = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < 10; i++){
      _listViewArray.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new EasyRefresh(
        key: _easyRefreshKey,
          behavior: ScrollOverBehavior(),
          refreshHeader: ClassicsHeader(
            key: _headerKey,
            refreshText: "pullToRefresh",
            refreshReadyText: "releaseToRefresh",
            refreshingText: "refreshing...",
            refreshedText: "refreshed",
            moreInfo: ("updateAt"),
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            moreInfoColor: Colors.black54,
            showMore: true,
          ),
          refreshFooter: ClassicsFooter(
            key: _footerKey,
            loadText: ("pushToLoad"),
            loadReadyText: ("releaseToLoad"),
            loadingText: "loading",
            loadedText: "loaded",
            noMoreText: "noMore",
            moreInfo: "updateAt",
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            moreInfoColor: Colors.black54,
            showMore: true,
          ),
          child: new ListView.builder(
            itemCount: _listViewArray.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  child: Card(
                    child: Center(
                      child: Text(
                        _listViewArray[index],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              }),
        onRefresh: () async{
          await new Future.delayed(const Duration(seconds: 2), () {
             setState(() {
               _listViewArray.clear();
               for(int i = 0; i < 10; i++){
                 _listViewArray.add(i.toString());
               }
               _easyRefreshKey.currentState.waitState(() {
                 setState(() {
                   _loadMore = true;
                 });
               });
             });
          });
        },
        loadMore: _loadMore ? () async {
          await new Future.delayed(Duration(seconds: 2), () {
              setState(() {
                _listViewArray.add(_listViewArray.length.toString());

              });
          }) ;
        } : null,
      ),

    );
  }
}
