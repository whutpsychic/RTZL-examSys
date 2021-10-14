import 'package:flutter/material.dart' hide Dialog;
import '../../../core/MyPage/MyScaffold.dart';
import '../../../UI/Dialog/main.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return MyScaffold(
      child: SafeArea(
        child: Container(
          color: Colors.grey[200],
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: _cancelLogin,
                child: Container(
                  width: _screenWidth,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    '退出登录',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _cancelLogin() {
    Dialog.of(context).confirm("操作", "您确定要退出登录吗？", () {
      Navigator.of(context).pushReplacementNamed("/login");
    });
  }
}
