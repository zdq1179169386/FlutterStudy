import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_app/generated/l10n.dart';
import 'package:flutter_github_app/state/user_state.dart';


class SettingPage extends StatelessWidget{
  static final String pageName = "/setting";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).setting),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _logoutBtn(context),
          ],
        ),
      ),
    );
  }

  Widget _logoutBtn(BuildContext context) {
    return Padding(
      child: RaisedButton(
        child: Text(S.of(context).logout,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        onPressed: () async {
          bool value = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("您确定退出吗？"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("取消"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text("确定"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              }
          );
          if (value == true){
            UserState().logout(context);
          }
        },
      ),
      padding: const EdgeInsets.only(left: 15,right: 15),
    );
  }
}