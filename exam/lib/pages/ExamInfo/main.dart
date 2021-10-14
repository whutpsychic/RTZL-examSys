import 'package:flutter/material.dart';
import '../../../core/MyPage/main.dart';
import '../../../core/Util/main.dart';
import '../../../UI/Button/main.dart';

class ExamInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<ExamInfo> with MyPage {
  @override
  Widget build(BuildContext context) {
    double _sw = MediaQuery.of(context).size.width;
    return MyScaffold(
      title: "考试信息",
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(children: [
              Text("这里显示的是本次考试相关的详细信息"),
              Text("包括考试时间，考试题目数量，总分，考试截止时间以及考试状态等信息")
            ]),
            Positioned(
              bottom: 0,
              child: Container(
                width: _sw,
                child: _renderRef(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _renderRef() {
    Map? obj = Util.getArgs(context);
    int t = obj?['type'];
    switch (t) {
      case 1:
        return BlockButton(child: Text("继续考试"), onPressed: _goToExam);
      case 2:
        return BlockButton(child: Text("开始考试"), onPressed: _goToExam);
      case 3:
        return BlockButton(
          disabled: true,
          child: Text("考试已结束"),
          onPressed: () {},
        );
      default:
        return Text("未知状态");
    }
  }

  _goToExam() {
    Navigator.of(context).pushNamed('/examing', arguments: {"total": 6});
  }
}
