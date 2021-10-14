import 'package:flutter/material.dart';

// 固定缝隙
const double crape = 10;

class MenuItems extends StatefulWidget {
  final Function(String x) onTap;
  MenuItems({required this.onTap});

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Wrap(
        children: [
          MenuItem(
            icon: Icon(Icons.ac_unit, size: 30, color: Colors.white),
            title: "目录一",
            color: Colors.red,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.access_alarm, size: 30, color: Colors.white),
            title: "目录二",
            color: Colors.orange,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.access_time, size: 30, color: Colors.white),
            title: "目录三",
            color: Colors.green,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.accessibility, size: 30, color: Colors.white),
            title: "目录四",
            color: Colors.blue,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.account_box, size: 30, color: Colors.white),
            title: "目录五",
            color: Colors.purple,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.ac_unit, size: 30, color: Colors.white),
            title: "目录六",
            color: Colors.red,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.access_alarm, size: 30, color: Colors.white),
            title: "目录七",
            color: Colors.orange,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.access_time, size: 30, color: Colors.white),
            title: "目录八",
            color: Colors.green,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.accessibility, size: 30, color: Colors.white),
            title: "目录九",
            color: Colors.blue,
            onTap: _onTapItem,
          ),
          MenuItem(
            icon: Icon(Icons.account_box, size: 30, color: Colors.white),
            title: "目录十",
            color: Colors.purple,
            onTap: _onTapItem,
          ),
        ],
      ),
    );
  }

  _onTapItem(t) {
    widget.onTap(t);
  }
}

// 单个菜单项
class MenuItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color color;
  final Function(String x) onTap;

  MenuItem({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double _sw = MediaQuery.of(context).size.width;
    double _size = (_sw - crape * 10) / 4;
    return GestureDetector(
      onTap: () {
        onTap(title);
      },
      child: Container(
        width: _size,
        height: _size,
        margin: EdgeInsets.all(crape),
        padding: EdgeInsets.symmetric(vertical: 6),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
