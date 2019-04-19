import 'package:flutter/material.dart';

class ZDLimitedBox extends StatelessWidget {
  const ZDLimitedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LimitedBox"),
        leading: new BackButton(),
      ),
      body: new ZDLimitedBoxContent(),
    );
  }
}
// LimitedBox 就是限制最大宽度和最大高度， ConstrainedBox 也可以实现
class ZDLimitedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 100.0,
        ),
        LimitedBox(
          maxWidth: 150.0,
          child: Container(
            color: Colors.blue,
            width: 250.0,
          ),
        ),
      ],
    );
  }
}
