import 'package:flutter/material.dart';
import '../../../core/MyPage/MyScaffold.dart';

class Study extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Study> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Container(
        child: Text('Study'),
      ),
    );
  }
}
