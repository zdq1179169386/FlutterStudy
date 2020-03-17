import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/page/home.dart';
import 'package:flutter_github_app/page/mine.dart';
import 'package:flutter_github_app/page/trend.dart';
import 'package:flutter_github_app/page/login.dart';
import 'package:flutter_github_app/page/welcome.dart';
import 'package:flutter_github_app/page/setting.dart';
import 'package:flutter_github_app/page/login_next.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'tab',
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/login' : (_) => new Login(),
        '/welcome' : (_) => new Welcome(),
        '/setting' : (_) => new Setting(),
        '/login_next': (_) => new LoginNext(''),
      },
      theme: CupertinoThemeData(
        primaryColor: Colors.blue
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home,size: 25),
            title: Text('home',style: TextStyle(fontSize: 12)),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections_solid,size: 25),
            title: Text('trend',style: TextStyle(fontSize: 12)),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled,size: 25),
            title: Text('mine',style: TextStyle(fontSize: 12)),
          ),
        ]),
      tabBuilder: (context, index) {
          switch (index){
            case 0 :
              return Home();
              break;
            case 1 :
              return Trend();
              break;
            case 2 :
              return Mine();
              break;
          }
          return Container();
      },
    );
  }
}
