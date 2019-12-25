import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var item1 = Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: (Row(
        children: <Widget>[
          Icon(
            Icons.extension,
            color: Colors.blue,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "好友微视",
              style: TextStyle(fontSize: 18),
            ),
          )),
          Icon(Icons.arrow_forward)
        ],
      )),
    );

    var item2 = Container(
        height: 70,
        color: Colors.deepPurpleAccent,
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Image.network(
              "http://img3.duitang.com/uploads/item/201504/07/20150407H4809_fzN5t.thumb.700_0.jpeg",
              width: 45,
              height: 45,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("心如止水"),
                    Text(
                      "心如止水",
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("06:45"),
                Icon(
                  Icons.visibility_off,
                  size: 20,
                  color: Color(0xff999999),
                )
              ],
            ),
          ],
        ));

    var item3 = Container(
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Image.network(
            "http://img3.duitang.com/uploads/item/201504/07/20150407H4809_fzN5t.thumb.700_0.jpeg",
            width: 50,
            height: 50,
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "1TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "TextTextTextText",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "TextTextTextText",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //将主轴空白位置进行均分，排列子元素，首尾子控件距边缘没有间隙
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_alarm,
                      size: 20,
                    ),
                    Icon(
                      Icons.info,
                      size: 20,
                    ),
                    Icon(
                      Icons.print,
                      size: 20,
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text("编辑"),
                  textColor: Colors.white,
                  color: Colors.blue,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    var item4 = Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(
                "http://img3.duitang.com/uploads/item/201504/07/20150407H4809_fzN5t.thumb.700_0.jpeg",
                width: 20,
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("TextTextTextText"),
                ),
              ),
              Text("flutter"),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "TextTextTextTextTextTextTextTextTextTextTextTextTextTextTextText",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "TextTextTextTextTextTextTextTextTextTt",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )),
              Image.network(
                "http://img3.duitang.com/uploads/item/201504/07/20150407H4809_fzN5t.thumb.700_0.jpeg",
                width: 80,
                height: 80,
              )
            ],
          ),
        ],
      ),
    );

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("组合控件案例"),
        ),
        body: ListView(
          children: <Widget>[
            item1,
            SizedBox(
              height: 10,
            ),
            item2,
            item3,
            item4,
          ],
        ));
  }
}
