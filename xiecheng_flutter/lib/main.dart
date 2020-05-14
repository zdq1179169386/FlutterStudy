import 'package:flutter/material.dart';
import 'package:xiecheng_flutter/page/root_page.dart';
import 'package:xiecheng_flutter/user_module/user_manager.dart';
import 'package:xiecheng_flutter/page/login_page.dart';
import 'package:xiecheng_flutter/event_bus/global_eventbus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalEventBus().eventBus.on<UserLoginEvent>().listen((event) {
    //切换主页面
    print('登录成功');
    return runApp(new MyApp());
  });
  GlobalEventBus().eventBus.on<UserLogoutEvent>().listen((event) {
    //切换登录页
    print('退出登录');
    return runApp(new LoginState());
  });
  bool isLogined = await UserManager.sharedInstance().isLogined();
  if (isLogined) {
    print('登录过了');
    return runApp(new MyApp());
  } else {
    print('未登录');
    return runApp(new LoginState());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}

class LoginState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
