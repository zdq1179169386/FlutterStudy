import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/global.dart';
import 'package:flutter_github_app/model/user.dart';
import 'package:flutter_github_app/net/git.dart';
import 'package:flutter_github_app/net/result_data.dart';
import 'package:flutter_github_app/page/login_page.dart';
import 'package:flutter_github_app/page/main_page.dart';
import 'package:flutter_github_app/state/z_state.dart';
import 'package:provider/provider.dart';

class UserState extends ZState {
    User get user => Global.user;

    set user(User user) {
        Global.user = user;
        //更新user 信息
        notifyListeners();
        if (Global.isDebug){
            print("更新user 信息");
        }
    }
    //是否登录
    bool get isLogin => user != null;

    //登录
   Future<bool> login(BuildContext context,String name, String password) async {
        String basic = 'Basic ' + base64.encode(utf8.encode('$name:$password'));
        ResultData resultData = await Git(context).get("users/$name", null, context, true);
        if (resultData != null && resultData.success){
            //设置token
            Global.token = basic;
            Git.dio.options.headers[HttpHeaders.authorizationHeader] = Global.token;
            //更新user
            User user = new User.fromJson(resultData.data);
            Provider.of<UserState>(context, listen: false).user = user;
            Navigator.pushReplacementNamed(context, MainPage.pageName);
            return true;
        }
        return false;
    }
    ///登出
    logout(BuildContext context) {
      if (Global.isDebug){
        print("退出登录");
      }
      Provider.of<UserState>(context, listen: false).user = null;
      //pushAndRemoveUntil 会删除之前导航栈里的所有元素,然后再push
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (route) => false);
    }
}