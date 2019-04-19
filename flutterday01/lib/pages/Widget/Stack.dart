import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ZDStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stack'),
      ),
      body: new ZDStackBody(),
    );
  }
}
//stack 绝对布局
class ZDStackBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('images/pic.jpg'),
          radius: 100.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: new Text('Hello',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        )
      ],
    );
  }
}
