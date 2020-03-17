import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Home',style: TextStyle(fontSize: 18)),
          heroTag: 'home',
          transitionBetweenRoutes: false,
        ),
        child: new HomeBody()
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(15, 108, 15, 0),
      child:  new Text(
          ') + CupertinoPageScaffold + CupertinoNavigationBar'),
    );
  }
}
