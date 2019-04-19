import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: CupertinoButton(
              child: const Tooltip(
                  message: 'Back',
                  child: Text('Exit')
              ),
              onPressed: (){
                Navigator.of(context,rootNavigator: true).pop();
              }),
        ),
        child: new CupertinoSecondPageBody() );
  }
}

class CupertinoSecondPageBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text('CupertinoSecondPage'),
    );
  }
}