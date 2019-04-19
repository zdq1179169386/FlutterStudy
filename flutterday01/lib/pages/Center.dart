import 'package:flutter/material.dart';

class ZDCenter extends StatelessWidget {
  const ZDCenter();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Center"),
        leading: new BackButton(),
      ),
      body: new ZDCenterBody(),
    );
  }
}

class ZDCenterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Center"),
    );
  }
}
