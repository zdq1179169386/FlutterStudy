import 'package:flutter/cupertino.dart';
import 'package:flutter_github_app/common/global.dart';

class ZState extends ChangeNotifier{
  @override
  void notifyListeners() {
    if (Global.user == null){
      Global.clearProfile();
    } else{
      Global.saveProfile();
    }
    super.notifyListeners();
  }
}