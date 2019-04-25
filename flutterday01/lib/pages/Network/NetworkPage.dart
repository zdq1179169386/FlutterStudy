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
                _post();
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
}
