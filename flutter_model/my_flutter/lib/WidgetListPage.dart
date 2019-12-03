import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widget List"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello World!',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              OutlineButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: Text("带边框Button"),
                  shape: Border.all(
                      color: Colors.amberAccent,
                      width: 1,
                      style: BorderStyle.solid)),
              OutlineButton(
                  child: Text("圆角Button"),
                  onPressed: () {},
                  color: Colors.green,
                  highlightedBorderColor: Colors.red,
                  splashColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.amberAccent,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              Image.network(
                "http://img3.duitang.com/uploads/item/201504/07/20150407H4809_fzN5t.thumb.700_0.jpeg",
                fit: BoxFit.fitWidth,
                width: 100.0,
//                height: 50.0,
              ),
              Image.asset(
                "images/ic_launcher_round.png",
                width: 100.0,
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
