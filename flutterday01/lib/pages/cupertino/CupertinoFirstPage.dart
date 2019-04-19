import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
//        右边的按钮
          trailing: CupertinoButton(
              child: const Tooltip(message: 'Back', child: Text('Exit')),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              }),
        ),
        child: new CupertinoFirstPageBody());

  }
}

class CupertinoFirstPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
        padding: EdgeInsets.fromLTRB(15, 108, 15, 0),
        child:  new Text(
            'CupertinoTabScaffold(脚手架) + CupertinoTabBar(底部tabbar) + CupertinoTabView(官方demo都是用这个组件包一层) + CupertinoPageScaffold + CupertinoNavigationBar'),
    );
  }
}
