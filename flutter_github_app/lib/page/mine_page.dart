import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_github_app/utils/z_style.dart';
import 'package:flutter_github_app/view/basic_listview_cell.dart';



class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineBodyState();
  }
}

class _MineBodyState extends State<MinePage>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ZStyle.vcBgColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: CachedNetworkImage(
                            imageUrl: '',
                            placeholder: (context,url) => new Image(image: AssetImage("images/avatar_placeholder@2x.png")),
                          ),
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.only(left: 15),
                        ),
                        Container(
                          child: Text('zdq',style: TextStyle(fontSize: 18)),
                          padding: const EdgeInsets.only(left: 10),
                        ),
                      ],
                    ),
                    Container(
                      child: new Icon(Icons.arrow_forward_ios,size: 20,color: Colors.blue),
                      padding: const EdgeInsets.only(right: 10),
                    )
                  ],
                ),
              ),
              Container(
                height: 15,
              ),
              new BasicListviewCell(
                index: 0,
                title: '仓库',
                onPress: () {
                    Navigator.pushNamed(context, "/login");
                },
              ),
              new BasicListviewCell(
                index: 1,
                title: '粉丝',
                onPress: (){

                },
              ),
              Container(
                height: window.physicalSize.height/5.0,
              )
            ],
          ),
        ),
      )
    );
  }
}
