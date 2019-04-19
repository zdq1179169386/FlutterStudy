import 'package:flutter/material.dart';

class ZDFittedBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FittedBox'),
      ),
      body: new ZDFittedBoxBody(),
    );
  }
}

class ZDFittedBoxBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.amberAccent,
      alignment: Alignment.center,
      width: 300,
      height: 300,
      child: new FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.center,
        child:  new Container(
          color: Colors.red,
          child: new Text(
              'BoxFit.fill',
          style: new TextStyle(fontSize: 20.0)),
        ),
      ),
    );
  }
}