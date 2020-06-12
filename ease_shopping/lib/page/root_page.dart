import 'dart:ui';
import 'package:ease_shopping/page/home_page.dart';
import 'package:ease_shopping/page/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class RootPage extends StatefulWidget {
  static final String pageName = "/root";

  @override
  State<StatefulWidget> createState() {
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
          _bottomItem('首页', Icons.home, 0),
          _bottomItem('我的', Icons.account_circle, 1),
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
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
