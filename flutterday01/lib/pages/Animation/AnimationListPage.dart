import 'package:flutter/material.dart';
import 'package:flutterday01/Views/ZDListViewItem.dart';
import 'package:flutterday01/Model/NormalModel.dart';


const List<NormalModel> listViewArray = [
  const NormalModel(
      title: 'flutter 动画',
      routePath: 'AnimationPage'
  ),

  const NormalModel(
      title: 'flutter 动画抽取',
      routePath: 'AnimationBuilderPage'
  ),

  const NormalModel(
      title: 'flutter Hero动画',
      routePath: 'HeroAnimationPage'
  ),
];

class AnimationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('AnimationListPage'),
      ),
      body: new AnimationListPageBody(),
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

class AnimationListPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: new ZDListViewItem(
            title: listViewArray[index].title,
            index: index,
            onPress: () {
              _navigateToPage(context, listViewArray[index].routePath);
            },
          ),
        );
      },
      itemCount: listViewArray.length);
  }
}

