import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/widget/GridWidgetPage.dart';
import 'package:my_flutter/widget/ListWidgetPage.dart';
import 'package:my_flutter/widget/TabBarPage.dart';

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
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 12,
          //阴影
          centerTitle: true,
          toolbarOpacity: .4, //透明度
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
                width: 200,
                child: Text(
                  _count.toString(),
                  maxLines: 1,
                  //最大行数1
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  //设置超过显示省略号
                  style: TextStyle(
                      fontWeight: FontWeight.bold, //粗体
                      color: Colors.amber, //颜色
                      fontSize: 20, //大小
                      background: Paint()..color = Colors.deepPurpleAccent),
                ),
              ),
              OutlineButton(
                  child: Text("OutlineButton"),
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
              FlatButton(
                child: Text("FlatButton"),
                textColor: Colors.white,
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {},
              ),
              Container(
                  //设置 margin 或者 padding 的 Widget。
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text("充满整个屏幕的RaisedButton"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    onPressed: () {},
                  )),
              Image.network(
                "http://img3.duitang.com/uploads/item/201504/07/20150407H4809_fzN5t.thumb.700_0.jpeg",
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              Image.asset(
                "images/ic_launcher_round.png",
                width: 50.0,
                height: 50.0,
              ),
              Row(
                // 创建一组水平的子组件集合
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Widget One',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text('Widget Two'),
                ],
              ),
              Offstage(
                offstage: false,
                child: Text('用Offstage包裹一下，offstage为true--隐藏，为false--显示'),
              ),
              Container(
                width: 150,
                height: 50,
                color: Colors.deepPurpleAccent,
                child: Align(
                  alignment: Alignment.topRight,
//                    widthFactor: 1.5,
                  child: Card(
                      elevation: 10,
                      color: Color(0xffffffff),
                      child: Text('Align。对齐容器')),
                ),
              ),
              FlatButton(
                child: Text("ListView"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => ListWidgetPage()));
                },
              ),
              FlatButton(
                child: Text("GridView"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => GridWidgetPage()));
                },
              ),
              FlatButton(
                child: Text("TabBar"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => TabBarPager()));
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 12,
          onPressed: _incrementCount,
          highlightElevation: 24,
          tooltip: 'Increment',
          //长按之后会显示的提示文字。
          child: Icon(Icons.add,
              size: 40, color: Colors.white, semanticLabel: "toly"),
        ),
      ),
    );
  }
}
