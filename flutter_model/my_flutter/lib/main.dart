import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/Flutter2Android.dart';
import 'package:my_flutter/widget/WidgetListPage.dart';

import 'demo/HomePage.dart';
//void main() => runApp(MyApp());
void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'toFlutter':
      return MaterialApp(
        home: Scaffold(
          body: MyHomePage(),
        ),
      );
    default:
      return MaterialApp(
        home: Scaffold(
          body: Container(),
        ),
      );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Flutter与Android交互"),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => InteractivePage()));
              },
            ),
//            RaisedButton(
//              child: Text("组件集合"),
//              onPressed: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => WidgetListPage()));
//              },
//            ),

            RaisedButton(
              child: Text("案例"),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => HomePage()));
              },

            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
