import 'package:flutter/material.dart';

class ZDConstrainedBox extends StatelessWidget {
  const ZDConstrainedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ConstrainedBox"),
        leading: new BackButton(),
      ),
      body: new ZDConstrainedBoxContent(),
    );
  }
}
// ConstrainedBox： 最大，最小 宽度和高度
class ZDConstrainedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
//      constraints: const BoxConstraints(
//        minWidth: 100.0,
//        minHeight: 100.0,
//        maxWidth: 150.0,
//        maxHeight: 150.0,
//      ),
//    紧贴的size
    constraints: new BoxConstraints.tight(new Size(250, 250)),
//宽松的size
//      constraints:  new BoxConstraints.loose(new Size(250, 250)),
      child: new Container(
        width: 200.0,
        height: 200.0,
        color: Colors.red,
      ),
    );
  }
}
