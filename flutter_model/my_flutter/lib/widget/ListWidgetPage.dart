import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GridWidgetPage.dart';

class ListWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.deepPurpleAccent,
      child: ListView.builder(
        itemCount: 20,
        //      scrollDirection:Axis.horizontal,  水平
        padding: EdgeInsets.all(8.0),
        itemExtent: 60.0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Center(child: Text('List $index')),
          );
        },
      ),
    );
  }
}
