import 'package:flutter/material.dart';
import '../../../core/MyPage/main.dart';
import '../../../core/Util/main.dart';
import '../../UI/Questions/main.dart';

class QuestionAnswer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<QuestionAnswer> with MyPage {
// 单选key
  GlobalKey<SelectSingleState> ssk = GlobalKey();
// 多选key
  GlobalKey<SelectMultiState> smk = GlobalKey();
// 单题内多选key
  GlobalKey<SelectInnersState> ismk = GlobalKey();
// 填空题key
  GlobalKey<FillInBlankState> fbk = GlobalKey();
// 判断题key
  GlobalKey<JudgmentState> jgk = GlobalKey();
// 简答题key
  GlobalKey<ShortAnswerState> sak = GlobalKey();

// 当前题目的key
  dynamic currKey;

  // 渲染题目
  _renderQuestion(currQuestion) {
    print(currQuestion);
    if (currQuestion != null) {
      switch (currQuestion['type']) {
        case 1:
        case "1":
          currKey = ssk;
          return SelectSingle(key: ssk, body: currQuestion!);
        case 2:
        case "2":
          currKey = smk;
          return SelectMulti(key: smk, body: currQuestion!);
        case 3:
        case "3":
          currKey = ismk;
          return SelectInners(key: ismk, body: currQuestion!);
        case 4:
        case "4":
          currKey = fbk;
          return FillInBlank(key: fbk, body: currQuestion!);
        case 5:
        case "5":
          currKey = jgk;
          return Judgment(key: jgk, body: currQuestion!);
        case 6:
        case "6":
          currKey = sak;
          return ShortAnswer(key: sak, body: currQuestion!);
        case 7:
        case "7":
        default:
          return Container();
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    double _sw = MediaQuery.of(context).size.width;
    Map? args = Util.getArgs(context);
    Map data = {};
    if (args != null) data = args['data'];
    return MyScaffold(
      title: "错题分析",
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  getQuestionTypeName(data["type"]),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _renderQuestion(data),
              Container(height: 1, color: Colors.grey[400]),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("【解】",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(data["description"] ?? ""),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
