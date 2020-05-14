import 'package:flutter/material.dart';
import 'package:xiecheng_flutter/event_bus/global_eventbus.dart';
import 'package:xiecheng_flutter/user_module/user.dart';
import 'package:xiecheng_flutter/user_module/user_manager.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State <HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container()
    );
  }
}