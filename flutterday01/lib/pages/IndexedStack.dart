import 'package:flutter/material.dart';

class ZDIndexedStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('IndexedStack'),
      ),
      body: new ZDIndexedStackBody(),
    );
  }
}

class ZDIndexedStackBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
      child: IndexedStack(
//        切换index，显示 children 数组中不同的子 widget
        index: 0,
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }
}
