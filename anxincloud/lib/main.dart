import 'package:flutter/material.dart';
import 'package:anxincloud/page/root_page.dart';

void main() {
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primaryIconTheme: IconThemeData(color: Colors.blue)
      ),
      home: RootPage(),
    );
  }
}