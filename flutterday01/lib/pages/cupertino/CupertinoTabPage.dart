import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterday01/pages//cupertino/CupertinoFirstPage.dart';
import 'package:flutterday01/pages//cupertino/CupertinoSecondPage.dart';
import 'package:flutterday01/pages//cupertino/CupertinoThirdPage.dart';

class ZDCupertinoTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: DefaultTextStyle(
          style: CupertinoTheme.of(context).textTheme.textStyle,
//          CupertinoTabScaffold 脚手架组件
          child: CupertinoTabScaffold(
//            CupertinoTabBar ： tabbar 组件
              tabBar: CupertinoTabBar(
                  items: const<BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home,size: 30),
                      title: Text('home',style: TextStyle(fontSize: 12)),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.conversation_bubble,size: 30),
                      title: Text('message',style: TextStyle(fontSize: 12)),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.profile_circled,size: 30),
                      title: Text('mine',style: TextStyle(fontSize: 12)),
                    ),
                  ]),
              tabBuilder: (BuildContext buildContext,int index){
                assert(index >= 0 && index <= 2);
                switch(index){
                  case 0 :
                    return CupertinoTabView(
                      builder: (BuildContext buildContext) => CupertinoFirstPage(),
                      defaultTitle: 'CupertinoFirstPage',
                    );
                    break;
                  case 1 :
                    return CupertinoTabView(
                      builder: (BuildContext buildContext) => CupertinoSecondPage(),
                      defaultTitle: 'CupertinoSecondPage',
                    );
                    break;
                  case 2 :
                    return CupertinoTabView(
                      builder: (BuildContext buildContext) => CupertinoThirdPage(),
                      defaultTitle: 'CupertinoThirdPage',
                    );
                    break;
                }
              })),
    );
  }
}
