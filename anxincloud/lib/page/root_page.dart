import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anxincloud/page/home_page.dart';
import 'package:anxincloud/page/mine_page.dart';
import 'package:anxincloud/page/work_desk.dart';


class RootPage  extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootPageState();
  }

}

class _RootPageState extends State<RootPage>{
//vc 数组
  List<Widget> _vcList;
//  选中的vc
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _vcList = new List();
    //.. 级联操作符
    _vcList..add(HomePage('home'))..add(WorkDeskPage("work"))..add(MinePage('mine'));
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).primaryColor;
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: const<BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(IconData(0xe6d7,fontFamily: 'iconfont'),size: 23),
                title: Text("home",style: TextStyle(fontSize: 12)),
              ),
              BottomNavigationBarItem(
                icon:Icon(IconData(0xe6b4,fontFamily: 'iconfont'),size: 23),
                title: Text('message',style: TextStyle(fontSize: 12)),
              ),
              BottomNavigationBarItem(
                icon: Icon(IconData(0xe6b8,fontFamily: 'iconfont'),size: 23),
                title: Text('mine',style: TextStyle(fontSize: 12)),
              ),
            ],
        ),
        tabBuilder: (BuildContext context, int index){
          assert(index >= 0 && index <= 2);
          return CupertinoTabView(
            builder: (BuildContext context) => _vcList[index],
            defaultTitle: "首页",
          );
        });
  }
}