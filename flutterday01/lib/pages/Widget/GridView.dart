import 'package:flutter/material.dart';

class ZDGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('GridView'),
      ),
      body: new ZDGridViewBody(),
    );
  }
}
//collectionview 布局，瀑布流布局怎么布局
class ZDGridViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: GridView.count(
          crossAxisCount: 2,
//倒序
//          reverse: true,
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          children: List.generate(100, (index) {
            return Container(
              color: Colors.grey,
              padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: Container(
                color: Colors.pink,
                child: Center(
                  child: Text('Item $index',style: Theme.of(context).textTheme.headline),
                ),
              ),
            );
          })),
    );
  }
}
