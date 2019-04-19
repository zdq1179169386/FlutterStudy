import 'package:flutter/material.dart';

class ZDAlign extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('align'),
      ),
      body: new ZDAlignBody(),
    );
  }
}

//Alignment实际上是包含了两个属性的，其中第一个参数，-1.0是左边对齐，1.0是右边对齐，第二个参数，-1.0是顶部对齐，1.0是底部对齐
//widthFactor：宽度因子，如果设置的话，Align的宽度就是child的宽度乘以这个值，不能为负数。
//heightFactor：高度因子，如果设置的话，Align的高度就是child的高度乘以这个值，不能为负数。

class ZDAlignBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.red,
      child: new Align(
//        alignment: const Alignment(1.0, -1.0),
      alignment: Alignment.center,
        widthFactor: 3.0,
        heightFactor: 3.0,
        child: new Container(
          child: new Text('align'),
          color: Colors.amber,
        ),
      ),
    );
  }
}

