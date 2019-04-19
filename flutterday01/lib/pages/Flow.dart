import 'package:flutter/material.dart';

class ZDFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flow'),
      ),
      body: new ZDFlowBody(),
    );
  }
}
//如何实现瀑布流
class ZDFlowBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final width = (MediaQuery.of(context).size.width - 41) / 2.0;
    final height = width * 1.3;

    return Flow(
      delegate: ZDFlowDelegate(margin: EdgeInsets.fromLTRB(10, 10, 10, 0)),
      children: <Widget>[
        new Container(
          width: width,
          height: height,
          color: Colors.yellow,
        ),
        new Container(
          width: width,
          height: height,
          color: Colors.green,
        ),
        new Container(
          width: width,
          height: height,
          color: Colors.red,
        ),
        new Container(
          width: width,
          height: height,
          color: Colors.black,
        ),
        new Container(
          width: width,
          height: height,
          color: Colors.blue,
        ),
        new Container(
          width: width,
          height: height,
          color: Colors.lightGreenAccent,
        ),
        new Container(
          width: width,
          height: height,
          color: Colors.pink,
        ),
        new Container(
          width: width,
          height: height,
          color: Colors.grey,
        )
      ],
    );
  }
}

class ZDFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  ZDFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;

      if (w < context.size.width) {
//        不需要换行
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0));
        x = w + margin.left;
      } else {
        //换行
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return new Size(750, 2000.0);
  }
}

