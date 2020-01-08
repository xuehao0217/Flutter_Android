import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class WidgetGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _imgList = [
      "https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2458227883,4095122505&fm=26&gp=0.jpg",
      "https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4094400000,3327666375&fm=26&gp=0.jpg",
      "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3922447756,2440710177&fm=26&gp=0.jpg"
    ];
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

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("组合控件案例"),
        ),
        body: ListView(
          children: <Widget>[
            banner,
            Container(
              height: 800,
              child: ListTile(title: Text(""),),
            ),
          ],
        ));
  }
}
