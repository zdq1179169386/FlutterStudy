import 'package:flutter/material.dart';
import 'package:flutterday01/Views/ZDListViewItem.dart';
import 'package:flutterday01/Model/NormalModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

const List<NormalModel> listViewArray = [
  const NormalModel(title: '加载网络图片', routePath: 'ImageDemoPage1'),
  const NormalModel(title: '加载本地图片', routePath: 'ImageDemoPage2'),
  const NormalModel(title: '加载 placehold', routePath: ''),
  const NormalModel(title: '加载 自定义Icon', routePath: 'ImageDemoPage3')
];

//cached_network_image： 和 sdwebimage 功能一样
class ImageDemoPage1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text('cached_network_image'),
      ),
      body: new Center(
        child: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/250?image=9',
          placeholder: (context,url) => new CircularProgressIndicator()
      ),
      ),
    );
  }
}

class ImageDemoPage2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text('AssetImage'),
      ),
      body: new Center(
        child: new Image(image: AssetImage('images/pic.jpg'),height: 200,width: 200)
      ),
    );
  }
}


class ImageDemoPage3 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text('AssetImage'),
      ),
      body: new Center(
          child: new Text("The quick brown fox jumps over the lazy dog",
              // Center align text
              textAlign: TextAlign.center,
              // set a text style which defines a custom font
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 36,
                fontWeight: FontWeight.w300,
                color: Colors.blue
              ),
      ),
      ),
    );
  }
}

class ImageDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image'),
      ),
      body: new ImageDemoPageBody(),
    );
  }
}

//页面跳转
void _navigateToPage(BuildContext context, String page) {
  print('Page : $page');
  if (page.length == 0) {
    return;
  }
  Navigator.of(context).pushNamed('/$page');
}

class ImageDemoPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemBuilder: (BuildContext buildContext, int index) {
          return new ListTile(
            title: new ZDListViewItem(
              index: index,
              onPress: () {
                _navigateToPage(context, listViewArray[index].routePath);
              },
              title: listViewArray[index].title,
            ),
          );
        },
        itemCount: listViewArray.length);
  }
}



