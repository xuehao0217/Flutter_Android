import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetListPage> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }


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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                _count.toString(),
                maxLines: 1,//最大行数1
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, //设置超过显示省略号
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amber),
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
                fit: BoxFit.cover,
                width: 300,
                height: 150,
              ),
              Image.asset(
                "images/ic_launcher_round.png",
                width: 100.0,
                height: 100.0,
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCount,
          tooltip: 'Increment', //长按之后会显示的提示文字。
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
