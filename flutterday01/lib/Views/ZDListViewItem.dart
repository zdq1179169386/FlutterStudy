import 'package:flutter/material.dart';

class ZDListViewItem extends StatelessWidget{
  ZDListViewItem({this.index,this.title,this.onPress});
  final int index;
  final String title;
//    无返回值的callback,父类传过来的点击事件
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: onPress,
      child: new Center(
        child: new Text(
          '$title',
          style: new TextStyle(fontSize: 16.0,color: Colors.black),
        ),
      ),
    );
  }
}