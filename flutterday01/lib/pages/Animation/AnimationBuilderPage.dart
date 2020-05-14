import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10),
      child: new FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child),
    );
  }
}

class AnimationBuilderPage extends StatefulWidget {
  _AnimationBuilderPageState createState() => new _AnimationBuilderPageState();
}

class _AnimationBuilderPageState extends State<AnimationBuilderPage> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
//    监听动画状态
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      } else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        title: Text('抽出动画'),
      ),
      body: new GrowTransition(child: new LogoWidget(), animation: animation),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}