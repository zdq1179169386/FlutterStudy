import 'package:flutter/material.dart';
import 'package:xiecheng_flutter/user_module/user_manager.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Container(
          child: Center(
              child: RaisedButton(
                  child: Text('退出登录'),
                  onPressed: () {
                    UserManager().logout();
                  }))),
    );
  }
}
