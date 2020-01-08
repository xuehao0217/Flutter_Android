import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter/demo/HomePage.dart';
import 'package:my_flutter/demo/My_Page.dart';
import 'package:my_flutter/demo/Search_Page.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentIndex = 0;

  void _onItemTapped(int value) {
    _pageController.jumpToPage(value);
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _onItemTapped,
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
        iconSize: 24.0,
        // BottomNavigationBarItem 中 icon 的大小
        currentIndex: _currentIndex,
        // 当前所高亮的按钮index
        onTap: _onItemTapped,
        // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
        fixedColor: Colors.deepPurple,
        // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text("搜索"), icon: Icon(Icons.search)),
          BottomNavigationBarItem(title: Text("我的"), icon: Icon(Icons.message)),
        ],
      ),
    );
  }
}
