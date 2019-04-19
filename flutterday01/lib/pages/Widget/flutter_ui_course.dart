import 'package:flutter/material.dart';
import 'package:flutterday01/Views/ZDListViewItem.dart';
import 'package:flutterday01/Model/NormalModel.dart';

//listview 数据源
const List<NormalModel> listViewArray = [
  const NormalModel(
    title: 'container 示例',
    routePath: 'container'
  ),
  const NormalModel(
      title: 'padding 示例',
      routePath: 'padding'
  ),
  const NormalModel(
      title: 'align 示例',
      routePath: 'align'
  ),
  const NormalModel(
      title: 'center 示例',
      routePath: 'center'
  ),
  const NormalModel(
      title: 'fittedbox 示例',
      routePath: 'fittedbox'
  ),
  const NormalModel(
    title: 'aspectratio 示例',
    routePath: 'aspectratio'
  ),
  const NormalModel(
    title: 'constrainedbox',
    routePath: 'constrainedbox'
  ),
  const NormalModel(
      title: 'baseline 示例',
      routePath: 'baseline'
  ),
  const NormalModel(
      title: 'FractionallySizedBox 示例',
      routePath: 'FractionallySizedBox'
  ),
  const NormalModel(
      title: 'LimitedBox 示例',
      routePath: 'LimitedBox'
  ),
  const NormalModel(
      title: 'SizedOverflowBox 示例',
      routePath: 'SizedOverflowBox'
  ),
  const NormalModel(
      title: 'Transform 示例',
      routePath: 'Transform'
  ),
  const NormalModel(
      title: 'CustomSingleChildLayout 示例',
      routePath: 'CustomSingleChildLayout'
  ),
  const NormalModel(
      title: 'Row 示例',
      routePath: 'Row'
  ),
  const NormalModel(
      title: 'Stack 示例',
      routePath: 'Stack'
  ),
  const NormalModel(
      title: 'IndexedStack 示例',
      routePath: 'IndexedStack'
  ),
  const NormalModel(
      title: 'GridView 示例',
      routePath: 'GridView'
  ),

  const NormalModel(
      title: 'Flow 示例',
      routePath: 'Flow'
  ),
];

class FlutterUICoursePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter ui 教程'),
        
      ),
      body: new FlutterUICoursePageBody(),
    );
  }
}

//页面跳转
void _navigateToPage(BuildContext context,String page){
  print('Page : $page');
  Navigator.of(context,rootNavigator: true).pushNamed('/$page');
}

class FlutterUICoursePageBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemBuilder: (BuildContext buildContext, int index){
          return new ListTile(
            title: new ZDListViewItem(
              index: index,
              title: listViewArray[index].title,
              onPress: () {
                _navigateToPage(context, listViewArray[index].routePath);

              },
            ),
          );
        },
      itemCount: listViewArray.length,
    );
  }
}