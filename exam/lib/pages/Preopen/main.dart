import 'package:flutter/material.dart';
import '../../core/MyPage/main.dart';
import '../../service/localStorage.dart';

class Preopen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Preopen> {
  @override
  void initState() {
    super.initState();
    // 检测是否有上次登录的痕迹
    // 检测上次登录用户名
    Future p1 = LocalStorage.getValue("userName");
    // 检测上次登录用户密码
    Future p2 = LocalStorage.getValue("password");

    Future.wait([p1, p2]).then((valueArr) {
      // 如果没有，则直接跳转到登陆页
      if (valueArr[0] == null || valueArr[1] == null) {
        Navigator.of(context).pushReplacementNamed("/login");
      } else {
        print('系统检测到有上次登录的痕迹');
        // 如果有，则按照痕迹自动登录

        // 登录失败后跳转至登陆页

        // 登录成功后跳转至主页
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Container());
  }
}
