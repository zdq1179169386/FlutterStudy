import 'package:flutter/material.dart';

class WorkDeskPage extends StatefulWidget{
//  私有变量
  String _title;
//  构造函数
  WorkDeskPage(this._title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WorkDeskPageState();
  }
}

class _WorkDeskPageState extends State <WorkDeskPage>{
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