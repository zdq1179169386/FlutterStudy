import 'package:flutter/material.dart';
import 'package:flutterday01/Model/NormalModel.dart';
import 'package:flutterday01/Views/ZDListViewItem.dart';

const List<NormalModel> _listViewArray = [
  const NormalModel(
      title: 'iOS 样式的tabbar + nav ',
      routePath: 'CupertinoTabPage'
  ),
  const NormalModel(
      title: 'flutrer 下拉刷新，上拉更多',
      routePath: 'RefreshPage'
  ),

  const NormalModel(
      title: 'flutrer 调用相册',
      routePath: ''
  ),
  const NormalModel(
      title: 'flutrer 调用相机',
      routePath: ''
  ),
  const NormalModel(
      title: 'flutrer 定位',
      routePath: ''
  ),
];

//页面跳转
void _navigateToPage(BuildContext context,String page){
  print('Page : $page');
  if(page.length == 0){
    return;
  }
  Navigator.of(context).pushNamed('/$page');
}

class SecondTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('My Favorite'),
//      ),
      body: new ListView.builder(
          itemBuilder: (BuildContext context,int index) {
            return ListTile(
              title: new ZDListViewItem(
                index: index,
                title: _listViewArray[index].title,
                onPress: () {
                  _navigateToPage(context,_listViewArray[index].routePath);
                },
              ),
            );
      },
      itemCount: _listViewArray.length),
    );
  }
}