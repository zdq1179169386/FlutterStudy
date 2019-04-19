import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('我的'),
//      ),
      backgroundColor: Colors.red,
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.person,
                size: 200,
                color: Colors.white,
              ),
              new Text(
                'third Tab',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}