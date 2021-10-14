import 'package:flutter/material.dart';
import '../../../UI/Questions/util.dart';

class QuestionItem extends StatefulWidget {
  final String title;
  final int? type;
  final Map? data;
  QuestionItem({required this.title, this.type, this.data});

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    String qt = getQuestionTypeName(widget.type);

    return GestureDetector(
      onTap: _goToDetail,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        width: 300,
        height: 45,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.menu_book),
            Text("【$qt】", style: TextStyle(color: Colors.red)),
            Flexible(
              child: Text(
                "${widget.data!['question']}",
                style: TextStyle(
                    color: Colors.red, overflow: TextOverflow.ellipsis),
              ),
            )
          ],
        ),
      ),
    );
  }

  _goToDetail() {
    Navigator.of(context)
        .pushNamed("/question-answer", arguments: {"data": widget.data});
  }
}
