import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_app/state/user_state.dart';
import 'package:flutter_github_app/page/login_page.dart';
import 'package:flutter_github_app/page/main_page.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _WelcomeBody();
  }
}

class _WelcomeBody extends State<WelcomePage>{
  bool hasInit = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (hasInit){
        return;
      }
      hasInit = true;
      UserState userState = Provider.of(context,listen: false);
      if (userState == null || !userState.isLogin) {
        //跳转登录页
        Navigator.pushReplacementNamed(context, LoginPage.pageName);
      } else{
        print(userState.user.toJson().toString());
        //跳转主页
        Navigator.pushReplacementNamed(context, MainPage.pageName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Center(
          child: Text("欢迎页"),
        ),
      ),
    );
  }
}