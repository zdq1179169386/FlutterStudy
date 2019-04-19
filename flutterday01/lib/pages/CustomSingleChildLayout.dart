import 'package:flutter/material.dart';

class ZDCustomSingleChildLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('CustomSingleChildLayout'),
      ),
      body: new ZDCustomSingleChildLayoutBody(),
    );
  }
}

class ZDCustomSingleChildLayoutBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(5.0),
      child: CustomSingleChildLayout(
        delegate: FixedSizeLayoutDelegate(Size(150.0, 200.0)),
        child: new Container(
          color: Colors.red,
          width: 100.0,
          height: 300.0,
        ),
      ),

    );
  }
}

class FixedSizeLayoutDelegate extends SingleChildLayoutDelegate{
  FixedSizeLayoutDelegate(this.size);
  final Size size;

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return size;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // TODO: implement getConstraintsForChild
    return new BoxConstraints.loose(size);
  }

  @override
  bool shouldRelayout(FixedSizeLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return size != oldDelegate.size;
  }
}