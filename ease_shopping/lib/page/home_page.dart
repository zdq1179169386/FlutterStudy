import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State <HomePage>{

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("home");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container()
    );
  }
}