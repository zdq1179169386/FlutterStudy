import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:loading/loading.dart';

class ProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressPage();
  }
}

class _ProgressPage extends State {
  ProgressDialog _p;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _p = new ProgressDialog(context, type: ProgressDialogType.Normal);
    _p.style(
      // message: '',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      insetAnimCurve: Curves.easeInOut,
      // progress: 0.0,
      // maxProgress: 100.0,
      // progressTextStyle: TextStyle(
      //     color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      // messageTextStyle: TextStyle(
      //     color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      appBar: new AppBar(
        title: new Text("ProgressPage"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Show ProgressDialog', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
            onPressed: () {
              _p.show();
              new Future.delayed(Duration(seconds: 3), () {
                _p.hide();
              });
            },
          ),
          RaisedButton(
          child: Text('Show Loading',style: TextStyle(color: Colors.white)),
          color: Colors.blue,
          onPressed: (){
            this.setState((){
            });
          },
        ),
        Loading(indicator: BallBeatIndicator(),size: 100.0,color: Colors.blueAccent)
        ],
      )),
    );
  }
}
