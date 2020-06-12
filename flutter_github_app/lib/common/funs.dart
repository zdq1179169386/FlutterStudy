
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget zAvatar(String url, {
  double width = 30,
  double height,
  BoxFit fit,
  BorderRadius borderRadius,
}) {
  var placeholder = Image.asset(
      "images/avatar-default.png", //头像默认值
      width: width,
      height: height
  );
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      imageUrl: url ?? "https://avatars3.githubusercontent.com/u/12589520?s=400&u=b5d077236cd15b97a5fb2e2fd76a65d862d3ff72&v=4",
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>placeholder,
      errorWidget: (context, url, error) =>placeholder,
    ),
  );
}


void showLoading(context, [String text]) {
  text = text ?? "Loading...";
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  //阴影
                  BoxShadow(
                    color: Colors.black12,
                    //offset: Offset(2.0,2.0),
                    blurRadius: 10.0,
                  )
                ]),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            constraints: BoxConstraints(minHeight: 120, minWidth: 180),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    text,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}