import 'package:ease_shopping/model/user_manager.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
    static final String pageName = "/login";

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameTextfield = TextEditingController();
  final TextEditingController _passwordTextfield = TextEditingController();

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
                    UserManager().login(context,_nameTextfield.text, _passwordTextfield.text);
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
