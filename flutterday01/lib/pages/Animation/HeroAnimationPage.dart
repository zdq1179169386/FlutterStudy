import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return new SizedBox(
      width: width,
      child: new Hero(
//        必须的，用于关联两个动画的标识
        tag: photo,
        child: new Material(
          color: Colors.transparent,
//          事件组件，单击，双击，长按
          child: new InkWell(
            onTap: onTap,
            child: new Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}



class HeroAnimationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: new Center(
        child: new PhotoHero(
          photo: 'images/pic.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return new Scaffold(
                    appBar: new AppBar(
                      title: const Text('Flippers Page'),
                    ),
                    body: new Container(
                      // The blue background emphasizes that it's a new route.
                      color: Colors.lightBlueAccent,
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.topLeft,
                      child: new PhotoHero(
                        photo: 'images/pic.jpg',
                        width: 100.0,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                }
            ));
          },
        ),
      ),
    );
  }
}