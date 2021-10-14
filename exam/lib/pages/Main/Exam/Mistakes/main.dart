import 'package:flutter/material.dart';
import '../../../../UI/PullToRefresh/main.dart';
import '../QuestionItem.dart';
import '../../../../static/fakeData.dart';

GlobalKey<PullToRefreshState> pk = GlobalKey();

class Mistakes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Mistakes> {
  List<Map> items = [];
  bool firstLoading = true;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    List<Map> _items = getMistakes();
    setState(() {
      items = _items;
      firstLoading = false;
    });
    pk.currentState?.refreshComplete();
  }

  void _onLoadMore() async {
    await Future.delayed(Duration(milliseconds: 1000));

    pk.currentState?.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        firstLoading ? Text("加载中...") : Container(),
        Container(
          margin: EdgeInsets.all(10),
          child: PullToRefresh(
            key: pk,
            child: ListView.builder(
              itemBuilder: (c, i) {
                return QuestionItem(
                  title: items[i]['question'],
                  type: items[i]['type'],
                  data: items[i],
                );
              },
              itemCount: items.length,
            ),
            onRefresh: _onRefresh,
            onLoadMore: _onLoadMore,
          ),
        )
      ],
    );
  }
}
