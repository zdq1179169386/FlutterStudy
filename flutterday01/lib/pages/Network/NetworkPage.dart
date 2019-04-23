import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('NetworkPage'),
      ),
      body: new NetworkPageBody(),
    );
  }
}

class NetworkPageBody extends StatefulWidget {
  @override
  _NetworkPageBodyState createState() {
    // TODO: implement createState
    return _NetworkPageBodyState();
  }
}

class _NetworkPageBodyState extends State<NetworkPageBody> {

  String _responseText = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('get'),
              onPressed: () {
                _get();
              },
              color: Colors.blue,
            ),
            RaisedButton(
              child: Text('post'),
              onPressed: () {
//                _post();
              _get1().then((s) {

              }).catchError((e) {

              });
              },
              color: Colors.blue,
            ),
            RaisedButton(
              child: Text('future'),
//              onError 和  catchError 只会调用一个，优先调用 onError
              onPressed: () {
                _testFuture().then((s) {
                  print(s);
                }, onError: (e) {
                  print(e);
                }).catchError((e) {
                  print(e);
                }).whenComplete(() {
                  print('complete');
                });
              },
              color: Colors.blue,
            ),
            RaisedButton(
              child: Text('future.delayed'),
//              onError 和  catchError 只会调用一个，优先调用 onError
//            timeout 如何 延时的时间 就会报错
              onPressed: () {
                print('t1:' + DateTime.now().toString());
                _test().timeout(new Duration(seconds: 4)).catchError((e) {
                  print('error' + e);
                }).whenComplete(() {});
                print('t2:' + DateTime.now().toString());
              },
              color: Colors.blue,
            ),
          ],
        ),
        Text(
          _responseText,
        )
      ],
    );
  }

  _get() async {
    var dio = new Dio();
    try {
      Response response = await dio
          .get('http://t.weather.sojson.com/api/weather/city/101030100');
      print('response = ' + response.data.toString());
      if (response.statusCode == 200) {
        setState(() {
          _responseText = response.data.toString();
        });
      }
    } on DioError catch (e) {
      print('error = ' + e.toString());
    }
  }
//  另外一种封装
 Future<String> _get1() async {
    var dio = new Dio();
    try {
      Response response = await dio
          .get('http://t.weather.sojson.com/api/weather/city/101030100');
      print('response = ' + response.data.toString());
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    } on DioError catch (e) {
      return e.toString();
    }
  }

  _post() async {
    var dio = new Dio();
    try {
      Response response = await dio
          .get('http://t.weather.sojson.com/api/weather/city/101030100');
      print('response = ' + response.data.toString());
    } on DioError catch (e) {
      print('error = ' + e.toString());
    }
  }

  Future<String> _testFuture(){
    return Future.value('success');
  }

  Future<int> _test() async {
    int result = await Future.delayed(Duration(seconds: 3), () {
      return Future.value(123);
    });
    print('t3:' + DateTime.now().toString());
    print(result);
  }

}
