
import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/global.dart';
import 'package:flutter_github_app/state/z_state.dart';

class LocaleState extends ZState{

  String get locale => Global.locale;

  set locale(String locale) {
    if (locale != Global.locale){
      Global.locale = locale;
      print("notify: "+Global.locale);
      notifyListeners();
    }
  }

  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    if (Global.locale == null) return null;
    var t = Global.locale.split("_");
    return Locale(t[0], t[1]);
  }
}