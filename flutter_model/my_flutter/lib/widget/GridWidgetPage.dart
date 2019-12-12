import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.deepPurpleAccent,
        child: GridView.count(
          crossAxisCount: 4,
          //      scrollDirection:Axis.horizontal,  水平
          children: List.generate(
            100,
            (index) {
              return Card(
                child: Center(child: Text('GridWidget $index')),
              );
            },
          ),
        ));
  }
}
