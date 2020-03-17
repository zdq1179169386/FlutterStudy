import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Trend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Trend',style: TextStyle(fontSize: 18)),
          heroTag: 'trend',
          transitionBetweenRoutes: false,
        ),
        child: new TrendBody());
  }
}

class TrendBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(15, 108, 15, 0),
      child:  new Text(
          'CupertinoTabScaffold(脚手架) + CupertinoTabBar(底部tabbar) + CupertinoTabView(官方demo都是用这个组件包一层) + CupertinoPageScaffold + CupertinoNavigationBar'),
    );
  }
}
