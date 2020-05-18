import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_app/page/main_page.dart';
import 'package:flutter_github_app/state/user_state.dart';

class LoginPage extends StatefulWidget{
  static final String pageName = "/login";
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',style: TextStyle(fontSize: 18)),
      ),
      body: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  child:CupertinoTextField(
                    controller: _unameController,
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
                    controller: _pwdController,
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
                       login(context);
                    },
                    color: Theme.of(context).primaryColor,
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

  login(BuildContext context) async {
    UserState().login(context, _unameController.text, _pwdController.text);
  }

  @override
  void dispose() {
    _unameController.dispose();
    _pwdController.dispose();
    super.dispose();
  }
}