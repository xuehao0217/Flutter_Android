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
                      style: BorderStyle.solid)
              ),
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
                      borderRadius: BorderRadius.all(Radius.circular(5)))
              ),


            ],
          ),
        ),
      ),
    );
  }
}
