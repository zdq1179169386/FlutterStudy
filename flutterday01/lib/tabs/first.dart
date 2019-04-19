import 'package:flutter/material.dart';
import 'package:flutterday01/Views/ZDListViewItem.dart';
import 'package:flutterday01/Model/NormalModel.dart';

//listview 数据源
const List<NormalModel> listViewArray = [
  const NormalModel(
    title: 'flutter UI 布局',
    routePath: 'flutter_ui_course'
  ),
  const NormalModel(
      title: 'iOS 样式的tabbar + nav ',
      routePath: 'CupertinoTabPage'
  ),
  const NormalModel(
      title: 'flutrer 动画',
      routePath: ''
  ),
  const NormalModel(
      title: 'flutrer 数据存储，数据库',
      routePath: ''
  ),
  const NormalModel(
      title: 'flutrer 网络请求',
      routePath: ''
  ),
  const NormalModel(
      title: 'flutrer 下拉刷新，上拉更多',
      routePath: ''
  ),

];

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('flutter UI 布局'),
//        ),
      body: new FirstTabContent(),
    );
  }
}
//页面跳转
void _navigateToPage(BuildContext context,String page){
  print('Page : $page');
  if(page.length == 0){
    return;
  }
  Navigator.of(context).pushNamed('/$page');
}

 class FirstTabContent extends StatelessWidget{
  @override 
   Widget build(BuildContext context) {

    return new ListView.builder(
        itemBuilder: (BuildContext buildContext,int index){
            return new ListTile(
              title: new ZDListViewItem(
                index: index,
                title: listViewArray[index].title,
                onPress: (){
                    _navigateToPage(context, listViewArray[index].routePath);
                },
              ),
            );
        },
      itemCount: listViewArray.length,
    );
  }
 }
