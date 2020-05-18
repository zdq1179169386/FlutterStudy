import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/global.dart';
import 'package:flutter_github_app/state/theme_state.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget{
  static final String pageName = "/theme";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: ListView( //显示主题色块
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeState>(context,listen: false).theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}

