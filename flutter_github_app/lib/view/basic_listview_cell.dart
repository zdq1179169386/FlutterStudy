import 'package:flutter/material.dart';

class BasicListviewCell extends StatelessWidget{
  ///初始化
  BasicListviewCell({this.index,this.title,this.onPress});
  ///索引
  final int index;
  ///标题
  final String title;
///无返回值的callback,父类传过来的点击事件
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPress,
      child: Container(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text('$title',style: TextStyle(fontSize: 15)),
            ),
            Container(
              child: new Icon(Icons.arrow_forward_ios,size: 20,color: Colors.blue),
              padding: const EdgeInsets.only(right: 10),
            ),
          ],
        ),
        height: 45,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12)
          )
        )
      )
    );
  }
}