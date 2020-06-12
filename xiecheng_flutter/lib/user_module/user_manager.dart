import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiecheng_flutter/event_bus/global_eventbus.dart';
import 'package:xiecheng_flutter/user_module/user.dart';

//登录事件
class UserLoginEvent {
  User user;
  UserLoginEvent(this.user);
}

//登出事件
class UserLogoutEvent {
  User user;
  UserLogoutEvent(this.user);
}

//更新用户事件
class UserUpdateEvent {
  User user;
  UserUpdateEvent(this.user);
}

//用户被踢事件
class UserKickEvent {
  User user;
  UserKickEvent(this.user);
}

//单例
class UserManager {
  User user;
  // 单例公开访问点
  factory UserManager() => sharedInstance();
  // 静态私有成员，没有初始化
  static UserManager _instance;
  // 私有构造函数
  UserManager._() {
    // 具体初始化代码
  }

  // 静态、同步、私有访问点
  static UserManager sharedInstance() {
    if (_instance == null) {
      _instance = UserManager._();
    }
    return _instance;
  }

  //是否登录
  Future<bool> isLogined() async {
    if (user == null) {
      final prefs = await SharedPreferences.getInstance();
      String userStr = prefs.getString('com.zdq.user');
      if (userStr == null) return false;
      print('登录用户:' + userStr);
      Map<String, dynamic> map = json.decode(userStr);
      user = new User.fromMap(map);
      return user == null ? false : true;
    } else {
      return user.isLogin;
    }
  }

  //登录
  login(String name, String password) async {
    if (name != null && password != null) {
      //登录成功
      user = new User(name: name, password: password);
      GlobalEventBus().eventBus.fire(UserLoginEvent(user));
      //存起来
      final prefs = await SharedPreferences.getInstance();
      String userStr = json.encode(user.toMap());
      if (userStr != null) {
        prefs.setString('com.zdq.user', userStr);
      }
    }
  }

  //退出登录
  logout() async {
    GlobalEventBus().eventBus.fire(UserLogoutEvent(user));
    user = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('com.zdq.user');
  }

  //更新用户信息
  updateUser(User user) {}
}
