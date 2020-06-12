import 'package:ease_shopping/model/user.dart';
import 'package:ease_shopping/model/user_manager.dart';
import 'package:ease_shopping/page/login_page.dart';
import 'package:ease_shopping/page/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  static final String pageName = "/";

  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {

  bool hasInit = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (hasInit){
        return;
      }
      hasInit = true;
      UserManager userManager = Provider.of(context,listen: false);
      if (userManager.isLogined()) {
        //跳转主页
        Navigator.pushReplacementNamed(context, RootPage.pageName);
        return;
      } else{
        //跳转登录页
        Navigator.pushReplacementNamed(context, LoginPage.pageName);
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(child: Text("欢迎页")),
        ));
  }
}
