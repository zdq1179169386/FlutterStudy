import 'package:flutter/material.dart';
import 'package:flutterday01/tabs/first.dart';
import 'package:flutterday01/tabs/second.dart';
import 'package:flutterday01/tabs/third.dart';
import 'package:flutterday01/pages/Widget//flutter_ui_course.dart';
import 'package:flutterday01/pages/Widget/Containter.dart';
import 'package:flutterday01/pages/Widget/Padding.dart';
import 'package:flutterday01/pages/Widget/Align.dart';
import 'package:flutterday01/pages/Widget/Center.dart';
import 'package:flutterday01/pages/Widget/FittedBox.dart';
import 'package:flutterday01/pages/Widget/AspectRatio.dart';
import 'package:flutterday01/pages/Widget/ConstrainedBox.dart';
import 'package:flutterday01/pages/Widget/Baseline.dart';
import 'package:flutterday01/pages/Widget/FractionallySizedBox.dart';
import 'package:flutterday01/pages/Widget/LimitedBox.dart';
import 'package:flutterday01/pages/Widget/SizedOverflowBox.dart';
import 'package:flutterday01/pages/Widget/Transform.dart';
import 'package:flutterday01/pages/Widget/CustomSingleChildLayout.dart';
import 'package:flutterday01/pages/Widget/Row.dart';
import 'package:flutterday01/pages/Widget/Stack.dart';
import 'package:flutterday01/pages/Widget/IndexedStack.dart';
import 'package:flutterday01/pages/Widget/GridView.dart';
import 'package:flutterday01/pages/Widget/Flow.dart';
import 'package:flutterday01/pages//cupertino/CupertinoTabPage.dart';
import 'package:flutterday01/pages/ImageDemo/ImageDemoPage.dart';
import 'package:flutterday01/pages/Animation/AnimationPage.dart';
import 'package:flutterday01/pages/Animation/AnimationBuilderPage.dart';
import 'package:flutterday01/pages/Animation/AnimationListPage.dart';
import 'package:flutterday01/pages/Animation/HeroAnimationPage.dart';
import 'package:flutterday01/pages/Swiper/SwiperPage.dart';

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
      '/FractionallySizedBox': (_) => new ZDFractionallySizedBox(),
      '/LimitedBox': (_) => new ZDLimitedBox(),
      '/SizedOverflowBox': (_) => new ZDSizedOverflowBox(),
      '/Transform': (_) => new ZDTransform(),
      '/CustomSingleChildLayout': (_) => new ZDCustomSingleChildLayout(),
      '/Row': (_) => new ZDRow(),
      '/Stack': (_) => new ZDStack(),
      '/IndexedStack': (_) => new ZDIndexedStack(),
      '/GridView': (_) => new ZDGridView(),
      '/Flow': (_) => new ZDFlow(),
      '/CupertinoTabPage': (_) => new ZDCupertinoTabPage(),
      '/ImageDemoPage': (_) => new ImageDemoPage(),
      '/ImageDemoPage1': (_) => new ImageDemoPage1(),
      '/ImageDemoPage2': (_) => new ImageDemoPage2(),
      '/ImageDemoPage3': (_) => new ImageDemoPage3(),
      '/AnimationPage': (_) => new AnimationPage(),
      '/AnimationBuilderPage': (_) => new AnimationBuilderPage(),
      '/AnimationListPage': (_)=> new AnimationListPage(),
      '/HeroAnimationPage':(_)=> new HeroAnimationPage(),
      '/SwiperPage':(_)=> new SwiperPage(),
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
//  int _currentIndex = 0;

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
              icon: new Icon(Icons.home, size: 28),
              text: '首页',
            ),
            new Tab(
              icon: new Icon(Icons.favorite, size: 28),
              text: '喜爱',
            ),
            new Tab(
              icon: new Icon(Icons.person, size: 28),
              text: '我的',
//            child: new Text('我的'),
            ),
          ],
          controller: controller,
            labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 8),
//去掉下划线
          indicatorWeight: 0.01,
          onTap: (int index) {
            if (index == 0) {
//              修改属性的时候，必须通过 setState 方法，这点跟 react 很像
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

  /*这种的，点击文字会有变大效果，
  @override
  Widget build(BuildContext context) {
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
        child: new BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('首页')),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), title: Text('最爱')),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('我的')),
            ],
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            }),
      ),
    );
  }*/
}
