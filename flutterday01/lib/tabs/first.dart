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
      title: 'flutrer 动画',
      routePath: 'AnimationListPage'
  ),
  const NormalModel(
      title: 'flutrer 图片',
      routePath: 'ImageDemoPage'
  ),
  const NormalModel(
      title: 'flutrer 轮播',
      routePath: 'SwiperPage'
  ),
  const NormalModel(
      title: 'flutrer 数据存储，数据库',
      routePath: 'DataSavePage'
  ),
  const NormalModel(
      title: 'flutrer 网络请求和 json 解析',
      routePath: 'NetworkPage'
  ),
  const NormalModel(
      title: 'flutrer 插件的使用',
      routePath: ''
  ),
  const NormalModel(
      title: '多线程',
      routePath: ''
  ),

  const NormalModel(
      title: 'Future 的用法',
      routePath: 'FuturePage'
  ),

];

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('flutter UI 布局'),
//        ),
      body: new FirstTabContent(),
    );
  }
}

//页面跳转
void _navigateGoToPage(BuildContext context,String page){
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
                    _navigateGoToPage(context, listViewArray[index].routePath);
                },
              ),
            );
        },
      itemCount: listViewArray.length,
    );
  }
 }

