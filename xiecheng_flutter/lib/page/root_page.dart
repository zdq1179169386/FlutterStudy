import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:xiecheng_flutter/view/tabbar_item.dart';
import 'package:xiecheng_flutter/page/home_page.dart';
import 'package:xiecheng_flutter/page/mine_page.dart';

class RootPage  extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootPageState();
  }

}

class _RootPageState extends State<RootPage>{
//vc 数组
  List<Widget> _vcList;
//  选中的vc
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _vcList = new List();
    //.. 级联操作符
    _vcList..add(HomePage('home'))..add(MinePage('mine'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _vcList[_index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TabbarItem('home',Icon(Icons.home),(){
              setState(() {
                _index = 0;
              });
            }),
            TabbarItem('me',Icon(Icons.near_me),(){
              setState(() {
                _index = 1;
              });
            }),
          ],
        ),
      ),
    );
  }
//  创建tabbar
  Widget createBottomAppBar() {
    if (Platform.isIOS) {

    } else if(Platform.isAndroid) {
      return new Material(
        child: ,
      )
    }
  }
}