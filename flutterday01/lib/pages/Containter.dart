import 'package:flutter/material.dart';

class Containter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('containter'),
      ),
      body: new ContainterBody(),
    );
  }
}

class ContainterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      constraints: new BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200,
      ),
      decoration: new BoxDecoration(
          border: new Border.all(width: 2.0, color: Colors.red),
          color: Colors.grey,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
//        背景图片,可以拉伸
          image: new DecorationImage(
            image: new NetworkImage(
                'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
            centerSlice: new Rect.fromLTRB(20, 0, 20, 0),
          )),
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: new Text('Hello world',style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
//      绕Z轴旋转
//      transform: new Matrix4.rotationZ(0.3),

    );
  }
}

/*
key：Container唯一标识符，用于查找更新。

alignment：控制child的对齐方式，如果container或者container父节点尺寸大于child的尺寸，这个属性设置会起作用，有很多种对齐方式。

padding：decoration内部的空白区域，如果有child的话，child位于padding内部。padding与margin的不同之处在于，padding是包含在content内，而margin则是外部边界，设置点击事件的话，padding区域会响应，而margin区域不会响应。

color：用来设置container背景色，如果foregroundDecoration设置的话，可能会遮盖color效果。

decoration：绘制在child后面的装饰，设置了decoration的话，就不能设置color属性，否则会报错，此时应该在decoration中进行颜色的设置。

foregroundDecoration：绘制在child前面的装饰。

width：container的宽度，设置为double.infinity可以强制在宽度上撑满，不设置，则根据child和父节点两者一起布局。

height：container的高度，设置为double.infinity可以强制在高度上撑满。

constraints：添加到child上额外的约束条件。

margin：围绕在decoration和child之外的空白区域，不属于内容区域。

transform：设置container的变换矩阵，类型为Matrix4。

child：container中的内容widget。
 */