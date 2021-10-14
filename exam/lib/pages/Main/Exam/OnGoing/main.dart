import 'package:flutter/material.dart';
import '../../../../UI/PullToRefresh/main.dart';
import '../ExamItem.dart';
import '../../../../static/fakeData.dart';

GlobalKey<PullToRefreshState> pk = GlobalKey();

class OnGoing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<OnGoing> {
  List<Map> items = [];
  bool firstLoading = true;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    List<Map> _items = onGonings();
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
                return ExamItem(
                  title: items[i]['title'],
                  description: items[i]['description'],
                  type: 1,
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
