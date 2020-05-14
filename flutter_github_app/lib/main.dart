import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/model/user_model.dart';
import 'package:flutter_github_app/page/main_page.dart';
import 'package:flutter_github_app/page/login_page.dart';
import 'package:flutter_github_app/page/welcome_page.dart';
import 'package:flutter_github_app/page/setting_page.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<UserModel>.value(value: UserModel())
    ],
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new WelcomePage(),
        routes: <String, WidgetBuilder>{
          LoginPage.pageName: (context) => new LoginPage(),
          MainPage.pageName: (context) => new MainPage(),
          SettingPage.pageName: (context) => new SettingPage(),
        },
      ),
    );
  }
}


