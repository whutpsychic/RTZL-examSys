import 'package:flutter/material.dart';

class ExamItem extends StatefulWidget {
  final String title;
  final String? description;
  final int? type;
  ExamItem({required this.title, this.description, this.type});

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<ExamItem> {
  // type
  // 默认 - 黑色
  // 1:正在进行的 - 绿色
  // 2:等待开始的 - 橙色
  // 3:已经结束的 - 红色
  Color judgeColor() {
    int _t = widget.type ?? 0;
    switch (_t) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _hasDes = widget.description != null;
    return GestureDetector(
      onTap: _goToDetail,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        height: 100,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: judgeColor()),
            ),
            _hasDes ? Text(widget.description!) : Container()
          ],
        ),
      ),
    );
  }

  _goToDetail() {
    Navigator.of(context)
        .pushNamed("/exam-info", arguments: {"type": widget.type ?? 0});
  }
}
