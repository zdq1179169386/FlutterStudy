import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('My Favorite'),
//      ),
      backgroundColor: Colors.red,
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.favorite,
                size: 200,
                color: Colors.white,
              ),
              new Text(
                'second Tab',
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