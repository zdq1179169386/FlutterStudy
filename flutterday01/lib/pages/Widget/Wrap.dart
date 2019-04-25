import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapPage'),
      ),
      body: new WrapPageBody(),
    );
  }
}
// Wrap 内容超过屏幕不会自动滑动，可以加在 SingleChildScrollView 的child 中
class WrapPageBody extends StatelessWidget{

   List<RaisedButton> _list = [];

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i< 80; i++){
      _list.add(
        RaisedButton(
          child: Text(i.toString(),style: TextStyle(fontSize: 18),),
          padding: EdgeInsets.all(10),
          onPressed: () {
            print('btn index =' + i.toString());
          },
        )
      );
    }

   return new SingleChildScrollView(
     child: new Container(
       padding: EdgeInsets.fromLTRB(10, 10, 0, 30),
       child: Wrap(
         spacing: 10.0,
         runSpacing: 10.0,
         alignment: WrapAlignment.start,
         crossAxisAlignment: WrapCrossAlignment.start,
         children: _list,
       ) ,
     )
   );
  }
}