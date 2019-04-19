import 'package:flutter/material.dart';

class ZDPadding extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Padding'),
      ),
      body: new ZDPaddingBody(),
    );
  }
}

class ZDPaddingBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Padding(
//      左上下右 的距离
      padding: const EdgeInsets.fromLTRB(30, 40, 50, 60),
      child: new Text('Padding'),
    );
  }
}