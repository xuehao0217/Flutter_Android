import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/api/Api.dart';
import 'package:my_flutter/entity/BannerEntity.dart';
import 'package:my_flutter/net/DioManager.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _searchPage();
}

class _searchPage extends State<SearchPage> {
  String name = "";
  String email = "";
  List<Data> picList = <Data>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Container(
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: picList != null && picList.length > 0 ? picList.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return picList != null && picList.length > 0
                ? Image(
                    image: NetworkImage(picList[index].imagePath),
                    width: 400.0,
                    height: 250.0,
                    fit: BoxFit.cover)
                : Text("no pics");
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getContent();
  }

  getContent() {
    DioManager.getInstance().get(Api.banner, (data) {
      setState(() {
        //更新UI等
        picList = bannerEntity.fromJson(data).data;
      });
    });
  }
}
