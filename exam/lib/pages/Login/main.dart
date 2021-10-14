import 'package:flutter/material.dart' hide Dialog;
import '../../core/MyPage/main.dart';
import '../../UI/Button/main.dart';
import '../../UI/Dialog/main.dart';

import './style.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Login> with MyPage {
  // 用户名输入框 controller
  TextEditingController _nController = TextEditingController();
  // 密码输入框 controller
  TextEditingController _pController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init(context);
    // 检测上次登录数据并填充
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Container(
        padding: EdgeInsets.only(top: 80),
        color: Colors.lightGreen,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
              child: Text("LOGO图标"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "考试答题系统",
                style: style.titleStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              color: Colors.white,
              child: TextField(
                controller: _nController,
                keyboardAppearance: Brightness.light,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '请输入用户名称',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              color: Colors.white,
              child: TextField(
                controller: _pController,
                keyboardAppearance: Brightness.light,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '请输入用户密码',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              child: BlockButton(child: Text('登录'), onPressed: _onLogin),
            )
          ],
        ),
      ),
    );
  }

  _onLogin() {
    // // 提示要填写用户名
    // if (_nController.text == "") {
    //   toast("请填写用户名");
    //   return;
    // }
    // // 提示要填写密码
    // if (_pController.text == "") {
    //   toast("请填写密码");
    //   return;
    // }

    // 假装登录
    Dialog.of(context).toast("登入中...");
    // 假装2秒后登录成功
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed("/main");
    });
  }
}
