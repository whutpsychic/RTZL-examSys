import 'package:flutter/material.dart';
import '../../../core/MyPage/MyScaffold.dart';
import './OnGoing/main.dart';
import './Waiting/main.dart';
import './End/main.dart';
import './Mistakes/main.dart';

class Tabber extends StatelessWidget {
  final String title;
  Tabber(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Text(title),
    );
  }
}

class Exam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Exam> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: MyScaffold(
        title: AppBar(
          title: const Text('考试'),
          bottom: TabBar(
            tabs: [
              Tabber("正在进行"),
              Tabber("等待开始"),
              Tabber("已经结束"),
              Tabber("错题回顾"),
            ],
          ),
        ),
        child: TabBarView(
          children: [
            OnGoing(),
            Waiting(),
            End(),
            Mistakes(),
          ],
        ),
      ),
    );
  }
}
