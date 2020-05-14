import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    return _NetworkPageBodyState();
  }
}

class _NetworkPageBodyState extends State<NetworkPageBody> {
  String _responseText = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('get'),
              onPressed: () {
                _push(context);
              },
              color: Colors.blue,
            ),
            RaisedButton(
              child: Text('post'),
              onPressed: () {
                _push(context);
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

  _push(BuildContext context) {
    Navigator.of(context).pushNamed('/NetworkNextPage');
  }
}
