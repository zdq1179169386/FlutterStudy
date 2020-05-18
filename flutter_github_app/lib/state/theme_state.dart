import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/global.dart';
import 'package:flutter_github_app/state/z_state.dart';

class ThemeState extends ZState {
  ColorSwatch get theme => Global.themes.firstWhere((element) => element.value == Global.theme, orElse:() => Colors.blue);

  set theme(ColorSwatch color) {
    if (color != theme) {
      //值不同，代表颜色深度不同
      Global.theme = color[500].value;
      print("notify theme:"+ Global.theme.toString());
      notifyListeners();
    }
  }
}