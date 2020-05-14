import 'package:flutter/material.dart';

class DataSavePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DataSavePage();
  }
}

class _DataSavePage extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DataSave')),
      body: Container(
          child: Center(
        child: Column(children: [
          RaisedButton(
            child: Text('shared_preferences',
                style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context).pushNamed('/SharedPreferencesPage');
            },
          ),
          RaisedButton(
            child: Text('数据库', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context).pushNamed('/SQLitePage');
            },
          )
        ]),
      )),
    );
  }
}
