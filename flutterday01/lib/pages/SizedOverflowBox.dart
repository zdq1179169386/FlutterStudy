import 'package:flutter/material.dart';

class ZDSizedOverflowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SizedOverflowBox'),
      ),
      body: new ZDSizedOverflowBoxBody(),
    );
  }
}

class ZDSizedOverflowBoxBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.green,
      alignment: Alignment.topRight,
      width: 200.0,
      height: 200.0,
      padding: EdgeInsets.all(5.0),
      child: SizedOverflowBox(
        size: Size(100.0, 200.0),
        child: new Container(
          color: Colors.red,
          width: 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}
