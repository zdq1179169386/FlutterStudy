import 'package:flutter/material.dart';

class ZDAspectRatio extends StatelessWidget {
  const ZDAspectRatio();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AspectRatio"),
        leading: new BackButton(),
      ),
      body: new ZDAspectRatioContent(),
    );
  }
}

class ZDAspectRatioContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      child: new AspectRatio(
//        宽高比
        aspectRatio: 1.5,
        child: new Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
