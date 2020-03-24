import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedPreferencesPage();
  }
}

//https://zhuanlan.zhihu.com/p/63694705
class _SharedPreferencesPage extends State {
  int _counter;

  @override
  void initState() {
    super.initState();
    _add();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SharedPreferencesPage')),
      body: Container(
          child: Center(
        child: Column(children: [
          RaisedButton(
            child:
                Text('增', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _add();
            },
          ),
          RaisedButton(
            child:
                Text('删', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _delete();
            },
          ),
          RaisedButton(
            child:
                Text('改', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _edit();
            },
          ),
          RaisedButton(
            child:
                Text('查', style: TextStyle(fontSize: 17, color: Colors.white)),
            color: Colors.blueAccent,
            onPressed: () {
              _read();
            },
          ),
          Text('$_counter'),
        ]),
      )),
    );
  }

  _add() async {
    _counter = 10;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _counter);
  }

  _delete() async {
    final prefs = await SharedPreferences.getInstance();
        _counter = 0;
    prefs.remove('counter');
  }

  _edit() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getInt('counter') ?? 0;
    prefs.setInt('counter', counter + 1);
    setState(() {
      _counter = counter;
    });
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getInt('counter') ?? 0;
    setState(() {
      _counter = counter;
    });
  }
}
