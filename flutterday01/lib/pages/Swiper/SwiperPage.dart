import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

List<String> _imgUrlList = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555926472110&di=98fe8f11e65d7b3c7f4693a8639787b6&imgtype=0&src=http%3A%2F%2Fu.candou.com%2Fs%2F500%2F2015%2F0904%2F1441301924766.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555926472109&di=d6b491bbfa3b55033bfbe4fdb688c87f&imgtype=0&src=http%3A%2F%2Fimages.17173.com%2F2012%2Fnews%2F2012%2F10%2F24%2Fgxy1024dj03s.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555926472108&di=7cbf082943666b432a3e53b72adc8ec8&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F3e9a0492a6a3e3242ac04b6dc6d085c297c4ac349c538-6AJcv1_fw658',
];

class SwiperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SwiperPageBody();
  }
}




class SwiperPageBody extends StatefulWidget {

  @override
  _SwiperPageBodyState createState() {
    // TODO: implement createState
    return _SwiperPageBodyState();
  }
}





class _SwiperPageBodyState extends State<SwiperPageBody> {
//导航透明度
  double _appBarAlpha = 0;


   _onScroll(offset) {
     double alpha = offset / 100.0;
    if(alpha < 0){
      alpha = 0;
    }else if (alpha > 1){
      alpha = 1;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//      MediaQuery.removePadding 去掉listview  的toppadding
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: NotificationListener(
                    onNotification: (ScrollNotification scrolllNotification) {
                      if (scrolllNotification is ScrollUpdateNotification &&
                          scrolllNotification.depth == 0) {
                        _onScroll(scrolllNotification.metrics.pixels);
                      }
                    },
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 220,
                          child: Swiper(
                            itemCount: _imgUrlList.length,
                            autoplay: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(_imgUrlList[index],
                                  fit: BoxFit.fill);
                            },
                            pagination: SwiperPagination(),
                          ),
                        ),
                        Container(
                          height: 800,
                          child: ListTile(
                            title: Text('ListTile'),
                          ),
                        ),
                      ],
                    ))),
            Opacity(
              opacity: _appBarAlpha,
              child: Container(
//                iPhone X
                height: MediaQuery.of(context).padding.top == 44 ? 88 : 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    BackButton(
                      color: Colors.blue,
                    ),
                   Padding(
                     padding: EdgeInsets.all(10),
                     child: Text(
                       '首页',
                         style: new TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         )
                     ),
                   ),
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.blue,
                      margin: EdgeInsets.all(10),
                    )
                  ],
                )
              ),
            )
          ],
        ));
  }
}