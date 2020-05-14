
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