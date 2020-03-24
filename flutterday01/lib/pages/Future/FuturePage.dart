import 'package:flutter/material.dart';
import 'dart:async';

// https://juejin.im/post/5d317e5af265da1b6c5faf73
class FuturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('FuturePage'),
      ),
      body: new FuturePageBody(),
    );
  }
}

class FuturePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            child: Text('future'),
            onPressed: () {
              _test().then((s) {
                print(s);
              }).catchError((e) {
                print(e);
              });
            },
          ),
        ),
        Expanded(
          child: RaisedButton(
            child: Text('future'),
            onPressed: () {
              new Future(() {
//                print('11');
                throw new Exception('error');
              }).catchError((e) {
                print('error' + e);
              });
            },
          ),
        )
      ],
    );
  }

  Future<String> _test() async {
    new Future<String>(() {
//      执行耗时操作
      throw new Exception('error');
    });
  }

  Future<String> _test1() {
    new Future.delayed(Duration(seconds: 3), () {
      return Future.value('123');
    });
  }
}
