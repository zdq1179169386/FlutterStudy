import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/funs.dart';
import 'package:flutter_github_app/common/global.dart';
import 'package:flutter_github_app/net/result_data.dart';

enum Method{
  Get,
  Post,
  Upload,
  Download,
}
class Git {
  BuildContext context;
  Options _options;

  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  ));

  static void init() {
    dio.interceptors.add(Global.netCache);
    //登录之后的每个请求都需要 + token;
    if (Global.token != null) {
      dio.options.headers[HttpHeaders.authorizationHeader] = Global.token;
    }
    dio.options.receiveTimeout = 20000;
    dio.options.connectTimeout = 20000;
  }

  ///get 请求
  get(String url,Map<String, dynamic>params,BuildContext context,bool showLoad) async {
   return _request(url, Method.Get, params, context, showLoad);
  }
  ///post 请求
  post(String url,Map<String, dynamic>params,BuildContext context,bool showLoad) {
   return _request(url, Method.Post, params, context, showLoad);
  }

  ///上传

  ///下载

  ///统一请求方法
  _request(String url,Method method,Map<String, dynamic>params,BuildContext context,bool showLoad) async {
    if (showLoad){
      showLoading(context);
    }
    try{
      Response response ;
      switch (method) {
        case Method.Get:{
          response = await dio.get(url,queryParameters: params);
          break;
        }
        case Method.Post:{
          response = await dio.post(url,queryParameters: params);
          break;
        }
      }
      if (Global.isDebug){
        print("------url:$url;"+ "queryParameters:" + response.request.queryParameters.toString() + ";response: ${response.data}");
      }
      return await handleDataSource(response, method,url: url);
    } catch (exception) {
      print("net exception:" + exception.toString());
      return new ResultData(null, false, "接口报错");
    } finally{
      if (showLoad){
        Navigator.of(context).pop();
      }
    }
  }

  /// 数据处理
  static handleDataSource(Response response, Method method, {String url = ""}) {
    ResultData resultData = new ResultData(null, false, null);
    if (response.statusCode == 200){
      resultData.success = true;
      //成功
      resultData.data = response.data;
    } else{
      resultData.success = true;
      resultData.error = "服务器返回数据有误";
    }
    return resultData;
  }
}