import 'package:flutter/material.dart';
import '../util.dart';

class SelectInners extends StatefulWidget {
  final Map body;
  SelectInners({Key? key, required this.body}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SelectInnersState();
}

class SelectInnersState extends State<SelectInners> {
  // 题干
  String _mainQuestion = "";
  // 选项
  List _answers = [];
  // 当前选择索引
  List<int?> selected = [];

  @override
  void initState() {
    super.initState();

    // 设置渲染(以防在build层反复渲染)
    setState(() {
      _mainQuestion = widget.body['question'];
      _answers = widget.body['answers'];

      //计算长度并预答案位置
      for (int i = 0; i < _answers.length; i++) {
        selected.add(null);
      }

      print(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Text(
            "\t\t\t\t$_mainQuestion",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        ..._renderAnswers(),
      ],
    );
  }

  getValue() {
    return selected;
  }

  _renderAnswers() {
    double _sw = MediaQuery.of(context).size.width;
    int num = 0;
    return _answers.map((el) {
      int ik = num++;
      return Container(
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("（ ${ik + 1} ）"),
              Container(
                width: _sw - 80,
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 24),
                color: Colors.grey[300],
              )
            ],
          ),
          ...el.map<Widget>((e) {
            int i = el.indexOf(e);
            return SelectItem(
              text: "${serilizedPrefix[i]}.$e",
              value: i,
              onTap: (v) => _onSelect(v, ik),
              active: selected[ik] == i,
              correct: widget.body['answer']?[ik] == i,
            );
          }).toList(),
        ]),
      );
    }).toList();
  }

  _onSelect(v, i) {
    setState(() {
      selected[i] = v;
    });
  }
}
