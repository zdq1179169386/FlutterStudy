import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationPage extends StatefulWidget {
  _AnimationPageState createState() => new _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
//会报这个错误  type '_AnimatedEvaluation<num>' is not a subtype of type 'Animation<double>' ，把 <double> 去掉，因为下面的赋值压根不是double 类型
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('动画'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.navigate_next),
//            tooltip: 'next',
//            onPressed: () {
//              Navigator.of(context).pushNamed('/AnimationBuilderPage');
//            },
//          )
//        ],

      ),
      body: new Container(
        color: Colors.white,
        child: new Center(
          child: new Container(
            margin: new EdgeInsets.symmetric(vertical: 10),
            height: animation.value,
            width: animation.value,
            child: new FlutterLogo(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
