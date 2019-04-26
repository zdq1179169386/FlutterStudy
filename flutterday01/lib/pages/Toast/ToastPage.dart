import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ToastPage extends StatefulWidget{

  @override
  _ToastPageState createState() {
    // TODO: implement createState
    return new _ToastPageState();
  }
}

class _ToastPageState extends State<ToastPage>{
  @override
  initState() {
    super.initState();
  }

  void showLongToast() {
    Fluttertoast.showToast(
      msg: "This is Long Toast，This is Long Toast，This is Long Toast，This is Long Toast",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void showColoredToast() {
    Fluttertoast.showToast(
        msg: "This is Colored Toast with android duration of 5 Sec",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  void showShortToast() {
    Fluttertoast.showToast(
        msg: "This is Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIos: 1);
  }

  void showTopShortToast() {
    Fluttertoast.showToast(
        msg: "This is Top Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1);
  }

  void showCenterShortToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast,This is Center Short Toast,This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1);
  }

  void cancelToast() {
    Fluttertoast.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Toast'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Long Toast'),
                  onPressed: showLongToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Short Toast'),
                  onPressed: showShortToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Center Short Toast'),
                  onPressed: showCenterShortToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Top Short Toast'),
                  onPressed: showTopShortToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                  child: new Text('Show Colored Toast'),
                  onPressed: showColoredToast),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton(
                child: new Text('Cancel Toasts'),
                onPressed: cancelToast,
              ),
            ),
          ],
        ),
      ),
    );
  }
}