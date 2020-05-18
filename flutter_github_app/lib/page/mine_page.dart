import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/common/funs.dart';
import 'package:flutter_github_app/generated/l10n.dart';
import 'package:flutter_github_app/page/language_page.dart';
import 'package:flutter_github_app/page/setting_page.dart';
import 'package:flutter_github_app/page/theme_page.dart';
import 'package:flutter_github_app/state/user_state.dart';
import 'package:flutter_github_app/utils/z_style.dart';
import 'package:flutter_github_app/widgets/user_item.dart';
import 'package:provider/provider.dart';



class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineBodyState();
  }
}

class _MineBodyState extends State<MinePage>{
  @override
  void initState() {
    print("MinePage initState");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mine),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            Navigator.pushNamed(context, SettingPage.pageName);
          })
        ],
      ),
      body: Container(
          color: ZStyle.vcBgColor,
          child: ListView(
            children: <Widget>[
              _buildHeader(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: UserItem(index: 0,title: S.of(context).theme,onPress: () {
                    Navigator.pushNamed(context, ThemePage.pageName);
                }),
              ),
              UserItem(index: 0,title: S.of(context).language ,onPress: () {
                Navigator.pushNamed(context, LanguagePage.pageName);
              }),
            ],
          )
      ),
    );
  }

  //头部
  Widget _buildHeader() {
    return Consumer<UserState>(
        builder: (BuildContext context, UserState userState,Widget child) {
          return GestureDetector(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 10),
                    child: ClipOval(
                      child: userState.isLogin ? zAvatar(userState.user.avatar_url,width: 80) : Image.asset("images/avatar-default.png",width: 80,),
                    ),
                  ),
                  Text(
                    userState.isLogin ? userState.user.login : "未登录",
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
    return Consumer<UserState>(
      builder:  (BuildContext context, UserState userState,Widget child){
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
        );
      },
    );
  }

  @override
  void dispose() {
    print("MinePage dispose");
    super.dispose();
  }
}
