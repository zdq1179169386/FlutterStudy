import 'dart:convert';
import 'package:ease_shopping/common/global.dart';
import 'package:ease_shopping/page/login_page.dart';
import 'package:ease_shopping/page/root_page.dart';
import 'package:flutter/material.dart';
import 'package:ease_shopping/model/user.dart';

//单例
class UserManager with ChangeNotifier {
  User get user => Global.user;

  //set 方法
  set user(User user) {

  }

  //是否登录
  bool isLogined() {
    return user == null ? false : true;
  }

  //登录
  login(BuildContext context, String name, String password) {
    if (name != null && password != null) {
      //登录成功
      user = new User(name: name, password: password);
      //存起来
      final prefs = Global.prefs;
      String userStr = json.encode(user.toMap());
      if (userStr != null) {
        prefs.setString('com.zdq.user', userStr);
        //通知
        notifyListeners();
        print("登录成功通知");

        Navigator.pushReplacementNamed(context, RootPage.pageName);

        //自定义路由动画
//      Navigator.of(context).pushReplacement(PageRouteBuilder(
//        pageBuilder: (BuildContext context, _, __) {
//            return RootPage();
//        },
//        opaque: false,
//        transitionsBuilder:  (___, Animation<double> animation,
//            ____, Widget child) {
//          return FadeTransition(
//            opacity: animation,
//            child: RotationTransition(
//              turns: Tween<double>(begin: 0.5, end: 1.0)
//                  .animate(animation),
//              child: child,
//            ),
//          );}
//      ));
      }
    }
  }

  //退出登录
  logout(BuildContext context)  {
    print("退出登录");
    user = null;
    final prefs = Global.prefs;
    prefs.remove('com.zdq.user');
    //通知
    notifyListeners();
    //pushAndRemoveUntil 会删除之前导航栈里的所有元素,然后再push
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => false);
  }

  //更新用户信息
  updateUser(User user) {
    user = user;
    //通知
    notifyListeners();
  }
}
