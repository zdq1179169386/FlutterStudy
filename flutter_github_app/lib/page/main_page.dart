import 'package:flutter/material.dart';
import 'package:flutter_github_app/generated/l10n.dart';
import 'package:flutter_github_app/page/home_page.dart';
import 'package:flutter_github_app/page/mine_page.dart';

class MainPage extends StatefulWidget{
  static final String pageName = "/main";

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final _defaultColor = Colors.grey;
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    print("mine:"+S.of(context).home);
    print("mine:" + S.of(context).home);
    return Scaffold(
      body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomePage(),
            MinePage(),
          ],
          physics: NeverScrollableScrollPhysics()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem(S.of(context).home, Icons.home, 0),
          _bottomItem(S.of(context).mine, Icons.account_circle, 1),
        ],
      ),
    );
  }

   _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : Theme.of(context).primaryColor),
        )
    );
  }
}