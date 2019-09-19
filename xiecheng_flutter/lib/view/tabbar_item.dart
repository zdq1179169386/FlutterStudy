import 'package:flutter/material.dart';


class TabbarItem  extends StatelessWidget{
  String _itemTitle;
  Icon _itemImg;
  VoidCallback _onPress;

  TabbarItem(this._itemTitle,this._itemImg,this._onPress);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: _itemImg,
            color: Colors.white,
            onPressed: _onPress,
          ),
          Text(_itemTitle,style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}