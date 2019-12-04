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
                maxLines: 1, //最大行数1
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, //设置超过显示省略号
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
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
//              //设置 margin 或者 padding 的 Widget。
              SizedBox(height: 20),
              Container(
                //1）给一些没有自带宽高的属性设置宽高。
                //比如我们上面讲到 Row 最后一个 Sample 的时候，给 Text、Row 设置宽高都是在外面套一层 Container。
                //2) 设置间距。
                padding: EdgeInsets.only(top: 20.0),
                color: Colors.blue,
                child: Image.network(   "http://img3.duitang.com/uploads/item/201504/07/20150407H4809_fzN5t.thumb.700_0.jpeg",width: 100,height: 100,),
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
