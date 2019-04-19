import 'package:flutter/material.dart';
import 'package:flutterday01/tabs/first.dart';
import 'package:flutterday01/tabs/second.dart';
import 'package:flutterday01/tabs/third.dart';
import 'package:flutterday01/pages/flutter_ui_course.dart';
import 'package:flutterday01/pages/Containter.dart';
import 'package:flutterday01/pages/Padding.dart';
import 'package:flutterday01/pages/Align.dart';
import 'package:flutterday01/pages/Center.dart';
import 'package:flutterday01/pages/FittedBox.dart';
import 'package:flutterday01/pages/AspectRatio.dart';
import 'package:flutterday01/pages/ConstrainedBox.dart';
import 'package:flutterday01/pages/Baseline.dart';
import 'package:flutterday01/pages/FractionallySizedBox.dart';
import 'package:flutterday01/pages/LimitedBox.dart';
import 'package:flutterday01/pages/SizedOverflowBox.dart';
import 'package:flutterday01/pages/Transform.dart';
import 'package:flutterday01/pages/CustomSingleChildLayout.dart';
import 'package:flutterday01/pages/Row.dart';
import 'package:flutterday01/pages/Stack.dart';
import 'package:flutterday01/pages/IndexedStack.dart';
import 'package:flutterday01/pages/GridView.dart';
import 'package:flutterday01/pages/Flow.dart';
import 'package:flutterday01/cupertino/CupertinoTabPage.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Tab',
    home: new MyHome(),
    routes: <String, WidgetBuilder>{
      '/flutter_ui_course': (_) => new FlutterUICoursePage(),
      '/container': (_) => new Containter(),
      '/padding': (_) => new ZDPadding(),
      '/align': (_) => new ZDAlign(),
      '/center': (_) => new ZDCenter(),
      '/fittedbox': (_) => new ZDFittedBox(),
      '/aspectratio': (_) => new ZDAspectRatio(),
      '/constrainedbox': (_) => new ZDConstrainedBox(),
      '/baseline': (_) => new ZDBaseline(),
      '/FractionallySizedBox' : (_)=> new ZDFractionallySizedBox(),
      '/LimitedBox' : (_)=> new ZDLimitedBox(),
      '/SizedOverflowBox':(_)=> new ZDSizedOverflowBox(),
      '/Transform':(_)=> new ZDTransform(),
      '/CustomSingleChildLayout':(_)=> new ZDCustomSingleChildLayout(),
      '/Row':(_)=> new ZDRow(),
      '/Stack':(_)=> new ZDStack(),
      '/IndexedStack':(_)=> new ZDIndexedStack(),
      '/GridView':(_)=> new ZDGridView(),
      '/Flow':(_)=> new ZDFlow(),
      '/CupertinoTabPage':(_)=> new ZDCupertinoTabPage(),
    },
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;
  String navTitle;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(navTitle ?? '首页'),
      ),
      body: new TabBarView(
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
//         样式还是有问题，图片和字之间间隙太大了
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.home, size: 30),
              text: '首页',
            ),
            new Tab(
              icon: new Icon(Icons.favorite, size: 30),
              text: '喜爱',
            ),
            new Tab(
              icon: new Icon(Icons.person, size: 30),
              text: '我的',
//            child: new Text('我的'),
            ),
          ],
          controller: controller,
          labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
//去掉下划线
//          indicatorWeight: 0.01,
          onTap: (int index) {
            if (index == 0) {
              setState(() {
                navTitle = '首页';
              });
            } else if (index == 1) {
              setState(() {
                navTitle = '最爱';
              });
            } else {
              setState(() {
                navTitle = '我的';
              });
            }
          },
        ),
      ),
    );
  }

}
