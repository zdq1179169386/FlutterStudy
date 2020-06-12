import 'dart:ui';

import 'package:ease_shopping/common/funs.dart';
import 'package:ease_shopping/common/z_style.dart';
import 'package:ease_shopping/model/user_manager.dart';
import 'package:ease_shopping/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            Navigator.pushNamed(context, SettingPage.pageName);
          })
        ],
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
              _buildHeader(),
            ],
          )
      ),
    );
  }
  //头部
  Widget _buildHeader() {
    return Consumer<UserManager>(
        builder: (BuildContext context, UserManager userModel,Widget child) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 10),
                    child: ClipOval(
                      child: userModel.isLogined() ? zAvatar(userModel.user.avatar,width: 80) : Image.asset("images/avatar-default.png",width: 80,),
                    ),
                  ),
                  Text(
                    userModel.isLogined() ? userModel.user.name : "未登录",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right:10),
                            child: new Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _buildCell(String name) {
    return Consumer<UserManager>(
      builder:  (BuildContext context, UserManager userModel,Widget child){
        return GestureDetector(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[

                ],
              ),
            ),
          ),
        )
      },
    )
  }
}
