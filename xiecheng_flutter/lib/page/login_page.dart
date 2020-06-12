import 'package:flutter/material.dart';
import 'package:xiecheng_flutter/user_module/user_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _nameTextfield = TextEditingController();
  final _passwordTextfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('登录')),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameTextfield,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                controller: _passwordTextfield,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              RaisedButton(
                  child: Text('登录'),
                  onPressed: () {
                    UserManager()
                        .login(_nameTextfield.text, _passwordTextfield.text);
                  })
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _nameTextfield.dispose();
    _passwordTextfield.dispose();
    super.dispose();
  }
}
