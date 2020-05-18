import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/net_cache.dart';
import 'package:flutter_github_app/model/cache_config.dart';
import 'package:flutter_github_app/model/user.dart';
import 'package:flutter_github_app/net/git.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String z_user_key = "com.zdq.user";
const String z_token_key = "com.zdq.token";
const String z_theme_key = "com.zdq.theme";
const String z_locale_key = "com.zdq.locale";

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global{
  static SharedPreferences prefs;
  static User user;
  static num theme;
  static String token;
  // 网络缓存对象
  static NetCache netCache = NetCache();
  static CacheConfig cacheConfig = new CacheConfig(enable: true, maxAge: 3600,maxCount: 100);
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  // 是否开启debug
  static bool isDebug = false;
  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;
  //语言
  static String locale;



  //异步获取用户数据
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    String userStr = prefs.getString(z_user_key);
    if (userStr != null){
      Map<String, dynamic> map = json.decode(userStr);
      user = new User.fromJson(map);
      token = prefs.get(z_token_key);
      theme = prefs.getInt(z_theme_key);
      locale = prefs.getString(z_locale_key);
    }
    //初始化网络
    Git.init();

    //开启debug
    isDebug = true;
  }

  /// 持久化Profile信息
  static saveProfile() {
    //存储用户数据
    if (user != null){
      prefs.setString(z_user_key, jsonEncode(user.toJson()));
      prefs.setString(z_token_key, token);
      prefs.setInt(z_theme_key, theme);
      prefs.setString(z_locale_key, locale);
    }
  }
  /// 清除持久化数据
  static clearProfile() {
    prefs.remove(z_user_key);
    prefs.remove(z_token_key);
    prefs.remove(z_theme_key);
    prefs.remove(z_locale_key);
  }
}