import 'dart:convert';
// import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_github_app/net/result_data.dart';


class HttpManager {
  Dio _dio = new Dio();

  static HttpManager _httpManager;

  static String GET = "get";

  static String POST = "post";

  static HttpManager shared() {
    if (_httpManager == null){
      _httpManager = HttpManager();
    }
    return _httpManager;
  }


  HttpManager(){
    _dio.options.connectTimeout = 20000;
    _dio.options.receiveTimeout = 5000;
  }

  get(String url,Map<String, dynamic> params) async{
    return request(url, params, HttpManager.GET);
  }
  ///post 请求
  post(String url,  Map<String, dynamic> params) async {
    return request(url, params, HttpManager.POST);
  }

  request(String url,Map<String, dynamic> params,String type) async{
    Response response;
    Options options ;

    if(type == null){
      options = new Options(method: HttpManager.GET);
    } else{
      options = new Options(method: type);
    }
    print("params = " + params.toString());
    try {
      response = await _dio.request(url,data: params,options: options);
      if(response.statusCode == 200 || response.statusCode == 201){
        print("success-url: " + url +";response: " + json.encode(response.data));
        return ResultData(response.data,true,null,50000);
      } else{
        return ResultData(null,false,"接口报错", 44444);
      }
    } on DioError catch(e){
      print("failure-url : " + url +";error: " + e.toString());
      if(e == null){
        return ResultData(null,false, e.toString(), 44444);
      } else{
        return ResultData(null,false,"接口报错", 44444);
      }
    }
  }
}

