import 'package:flutter/material.dart';

class ZDFractionallySizedBox extends StatelessWidget {
  const ZDFractionallySizedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FractionallySizedBox"),
        leading: new BackButton(),
      ),
      body: new ZDFractionallySizedBoxBody(),
    );
  }
}
/*
alignment：对齐方式，不能为null。

widthFactor：宽度因子，跟之前介绍的控件类似，宽度乘以这个值，就是最后的宽度。

heightFactor：高度因子，用作计算最后实际高度的。

其中widthFactor和heightFactor都有一个规则

如果不为null，那么实际的最大宽高度则为child的宽高乘以这个因子；
如果为null，那么child的宽高则会尽量充满整个区域。
*/

class ZDFractionallySizedBoxBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        color: Colors.blue,
        height: 150.0,
        width: 150.0,
        padding: const EdgeInsets.all(10.0),
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: 1.5,
          heightFactor: 0.5,
          child: new Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
