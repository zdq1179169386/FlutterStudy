
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'Model/CityWeatherModel.dart';

class NetworkNextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NetworkNextPage();
  }
}

class _NetworkNextPage extends State {
  CityWeatherModel _weatherModel;

  @override
  void initState() {
    super.initState();
    _get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_weatherModel != null
              ? _weatherModel.cityInfo.city + _weatherModel.cityInfo.updateTime
              : "")),
      body: Container(
        child: _getBody(),
      ),
    );
  }

  _get() async {
    var dio = new Dio(new BaseOptions(
      receiveTimeout: 200000,
      connectTimeout: 20000,
      responseType: ResponseType.json,
    ));
// json 转 model  https://javiercbk.github.io/json_to_dart/
    try {
      Response response = await dio
          .get('http://t.weather.sojson.com/api/weather/city/101030100');
      if (response.statusCode == 200) {
        //延迟1秒，显示菊花
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            Map map = new Map<String, dynamic>.from(response.data);
            _weatherModel = CityWeatherModel.fromJson(map);
          });
        });
      }
    } on DioError catch (e) {
      print('error = ' + e.toString());
    }
  }

  _getBody() {
    if (_weatherModel != null) {
      return EasyRefresh(
        child: new ListView.builder(
            itemCount: _weatherModel.data.forecast.length,
            itemBuilder: (BuildContext context, int index) {
              return _getItem(_weatherModel.data.forecast[index]);
            }),
        onRefresh: () async {
          _get();
        },
      );
    } else {
      return Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      ));
    }
  }

  _getItem(Forecast forecast) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Row(children: <Widget>[
                Text(forecast.ymd+' '+forecast.week,style: TextStyle(fontSize: 20),),
            ],),
            Padding(padding: const EdgeInsets.all(10),
            child: Row(children: <Widget>[
                Text(forecast.type+' '+ forecast.high + ' ' + forecast.low,style: TextStyle(fontSize: 15),),
            ],),),
            Text(forecast.fx),
            Text(forecast.fl),
            Text(forecast.notice),
          ])),
    );
  }
}
