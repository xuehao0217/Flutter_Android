import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homePage();
}

class _homePage extends State<HomePage> {
  var _imgList = [
    "https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2458227883,4095122505&fm=26&gp=0.jpg",
    "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4094400000,3327666375&fm=26&gp=0.jpg",
    "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3922447756,2440710177&fm=26&gp=0.jpg"
  ];

  double appBarAlpha = 0;
  _listViewScroll(offset) {
    double alpha = offset / 44;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    var banner = Container(
      height: 150,
      child: Swiper(
        autoplay: true,
        autoplayDelay: 1500,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _imgList[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: _imgList.length,
        pagination: SwiperPagination(),
      ),
    );

    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          removeTop: true, //移除状态栏
          context: context,
          child: NotificationListener(
              onNotification: (scroll) {
                if (scroll is ScrollUpdateNotification && scroll.depth == 0) {
                  //NotificationListener是第0个元素滚动才触发
                  _listViewScroll(scroll.metrics.pixels); //获取滚动距离
                }
              },
              child: ListView(
                children: <Widget>[
                  banner,
                  Container(
                    height: 1000,
                    child: ListTile(
                      title: Text(""),
                    ),
                  ),
                ],
              )),
        ),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 44,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text("首页"),
            ),
          ),
        ),
      ],
    ));
  }
}
