import 'package:flutter/material.dart';
import 'package:xiecheng_flutter/page/root_page.dart';

void main() {
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}