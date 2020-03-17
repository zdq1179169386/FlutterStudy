import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_app/dao/user_dao.dart';
import 'package:flutter_github_app/page/login_next.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<Login>{
  var _username = "";
  var _password = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: 'login',
        transitionBetweenRoutes: false,
        middle: Text('Login',style: TextStyle(fontSize: 18)),
      ),
      child: Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  child:CupertinoTextField(
                    autofocus: true,
                    style: TextStyle(fontSize: 15),
                    placeholder: "用户名",
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12,width: 0.5),
                      borderRadius:  const BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.only(left: 15),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 80, 20, 0),
                  height: 40,
                ),
                Container(
                  child:CupertinoTextField(
                    obscureText: true,
                    autofocus: true,
                    style: TextStyle(fontSize: 15),
                    placeholder: "密码",
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12,width: 0.5),
                      borderRadius:  const BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.only(left: 15),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  height: 40,
                ),
                Container(
                  child: CupertinoButton(
                    child: Text("登录",style: TextStyle(fontSize: 17,color: Colors.white)),
                    onPressed: (){
                       login();
                    },
                    color: Colors.blue,
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                    borderRadius: const BorderRadius.all(Radius.circular(23)),
                  ),
                  height: 46,
                  margin: const EdgeInsets.only(top: 50),
                )
              ],
            ),
          )
      ),
    );
  }

  login() {
    UserDao.login(_username.trim(), _password.trim()).then((res) {
      Navigator.push(context, new CupertinoPageRoute(
        builder: (context) => new LoginNext(json.encode(res.data)),
      ));
    });
  }
}