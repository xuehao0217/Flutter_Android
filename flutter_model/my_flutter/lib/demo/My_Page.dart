import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _myPage();
}

class _myPage extends State<MyPage> {
//  _setV(String user) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    await prefs.setString('user', user);
//  }
//
//  _getV() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    user = prefs.getString('user');
//  }

  String user = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          FlatButton(
//            child: Text("存数据"),
//            textColor: Colors.white,
//            color: Colors.blue,
//            onPressed: () {
////              _setV("flutter");
//            },
//          ),
//          FlatButton(
//            child: Text("取数据"),
//            textColor: Colors.white,
//            color: Colors.blue,
//            onPressed: () {
//              setState(() {
////                _getV();
//              });
//            },
//          ),
//          Text(user),
        ],
      ),
    );
  }
}
