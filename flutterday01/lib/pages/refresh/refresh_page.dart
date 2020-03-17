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
    return Center(
      child: Container(
        child: EasyRefresh(
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
                for(int i = 0; i < 10; i++) {
                  _listViewArray.add(i.toString());
                }
                _loadMore = true;
              });
            });
          },
          onLoad: _loadMore ? () async{
            await new Future.delayed(Duration(seconds: 2), () {
              setState(() {
                int count = _listViewArray.length;
                for(int i = count; i < count + 5; i++){
                  _listViewArray.add(i.toString());
                }
                _loadMore = _listViewArray.length > 30 ? false : true;
              });
            }) ;
          } : null,
        ),
      ),
    );
  }
}
