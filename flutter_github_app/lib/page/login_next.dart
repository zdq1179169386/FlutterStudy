import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginNext extends StatefulWidget {
  ///html
  String htmlStr;

  LoginNext(this.htmlStr);

  @override
  State<StatefulWidget> createState() {
    return _LoginNextState(this.htmlStr);
  }
}

class _LoginNextState extends State<LoginNext> {
  WebViewController _controller;

  ///html
  String htmlStr;

  _LoginNextState(this.htmlStr);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("code"),
        heroTag: 'login_next',
        transitionBetweenRoutes: false,
      ),
      child: SafeArea(
          child: Container(
        color: Colors.blue,
        child: WebView(
            initialUrl: "https://github.com",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
              _loadHtmlFromAssets();
            },
            onPageFinished: (String url) {
              print("web onPageFinished");
            },
            onPageStarted: (String url) {
              print("web onPageStarted");
            },
            navigationDelegate: (NavigationRequest request) {
              print("delegate: $request" );
            }),
      )),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = this.htmlStr;
    print("----" + fileText);
    _controller.loadUrl(new Uri.dataFromString(
      fileText,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString());
  }
}
