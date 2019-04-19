import 'package:flutter/material.dart';

class ZDTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Transform'),
      ),
      body: new ZDTransformBody(),
    );
  }
}

class ZDTransformBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        color: Colors.red,
        child: Transform(
          transform: Matrix4.rotationZ(0.3),
//          怎么调整旋转的起始点
          origin: Offset(0, 0.5),
//          alignment: Alignment.center,
          child: new Container(
            color: Colors.blue,
            width: 100.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
