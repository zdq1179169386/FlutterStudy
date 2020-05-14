
import 'dart:convert';

import 'package:ease_shopping/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global{
  static SharedPreferences prefs;
  static User user;

  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    String userStr = prefs.getString('com.zdq.user');
    if (userStr != null){
      Map<String, dynamic> map = json.decode(userStr);
      user = new User.fromMap(map);
    }
  }
}