import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
//  私有变量
  String _title;
//  构造函数
  MinePage(this._title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MinePageState();
  }
}

class _MinePageState extends State <MinePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
    );
  }
}