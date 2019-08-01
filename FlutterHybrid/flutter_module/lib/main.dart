import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(MyApp(initParams: window.defaultRouteName,));

class MyApp extends StatelessWidget {
  final String initParams;
  const MyApp({Key key, this.initParams}) : super(key:key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page',initParams: this.initParams,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.initParams}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String initParams;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static const BasicMessageChannel<String> _basicMessageChannel = const BasicMessageChannel("BasicMessageChannelPlugin", StringCodec());
//  MethodChannel 用于 flutter 向 native 通信
  static const MethodChannel _methodChannel = const MethodChannel("MethodChannelPlugin");

  static const EventChannel _eventChannel = const EventChannel("EventChannelPlugin");
  StreamSubscription _streamSubscription;

  bool _isMethodChannelPlugin = false;


  String showMessage = "";
  
  @override
  void initState() {
    // TODO: implement initState
//   初始化_basicMessageChannel 的回调， 接受并处理来自native 的消息，也可以向native 回复消息
    _basicMessageChannel.setMessageHandler((String message) => Future<String>((){

      setState(() {
        showMessage = "BasicMessageChannel:" + message;

      });
//      这里是收到来自native 端的消息之后，回复给native
      return  message;
    }));

//    设置 _eventChannel 的监听
    _eventChannel.receiveBroadcastStream('123').listen(_onToDart,onError: _onToDartError);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_streamSubscription != null){
      _streamSubscription.cancel();
      _streamSubscription = null;

    }
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _isMethodChannelPlugin,
              onChanged: _onChanelChanged,
              title: Text(_isMethodChannelPlugin ? "MethodChannelPlugin" : "BasicMessageChannelPlugin"),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.red,width: 0.5),
                borderRadius: new BorderRadius.all(Radius.circular(5)),
              ),
              child: TextField(
                onChanged: _onTextChange,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Text(
              'initParams: ${widget.initParams}'
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'Native传来的数据:' + showMessage,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onTextChange(value) async{
    String response;
    try {
      if (_isMethodChannelPlugin){
        //MethodChannel
        //向native 端发送消息
        response = await _methodChannel.invokeMethod("send",value);
      }else{
        response = await _basicMessageChannel.send(value);
      }

    } on PlatformException catch (e){
      print(e);
    }
    setState(() {
      showMessage = response ?? "";
    });
  }

  void _onToDart(message) {

    setState(() {
      showMessage = 'EventChannel' + message;
    });
  }

  void _onToDartError(error){
    print(error);
  }

  void _onChanelChanged(bool value) {
    setState(() {
      _isMethodChannelPlugin = value;
    });
  }
}
