import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
//  私有变量
  String _title;

  int age ;
//  构造函数
  HomePage(this._title);

//  其他的构造函数，可选参数和默认值
  HomePage.withAge(this._title,{this.age = 20});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State <HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Image(image: AssetImage("images/xz_tabbar_etplan_select.png")),
      ),
    );
  }
}