import 'package:flutter/material.dart';

class ZDRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Row'),
      ),
      body: new ZDRowBody(),
    );
  }
}

class ZDRowBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.grey,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              width: 50,
              height: 50,
            ),
//            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              width: 50,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              width: 50,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
//            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.pink,
              width: 50,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
//            flex: 1,
          ),
        ],
      ),
    );
  }
}
