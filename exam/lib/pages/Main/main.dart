import 'package:flutter/material.dart';
import '../../../core/MyPage/main.dart';

import './Home/main.dart';
// import './Study/main.dart';
import './Exam/main.dart';
import './Mine/main.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<HomePage> with MyPage {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Exam(),
    Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.menu_book),
          //   label: '学习',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_sharp),
            label: '考试',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: '我的',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xFF666666),
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
