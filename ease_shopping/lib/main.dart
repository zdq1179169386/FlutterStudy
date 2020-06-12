import 'package:ease_shopping/common/global.dart';
import 'package:ease_shopping/model/user.dart';
import 'package:ease_shopping/model/user_manager.dart';
import 'package:ease_shopping/page/login_page.dart';
import 'package:ease_shopping/page/root_page.dart';
import 'package:ease_shopping/page/setting_page.dart';
import 'package:ease_shopping/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
   Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<UserManager>.value(value: UserManager())
    ],
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new WelcomePage(),
        routes: <String, WidgetBuilder>{
          LoginPage.pageName: (context) => new LoginPage(),
          RootPage.pageName: (context) => new RootPage(),
          SettingPage.pageName: (context) => new SettingPage(),
        },
      ),
    );
  }
}

