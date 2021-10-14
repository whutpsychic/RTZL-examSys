// =======================================
// flutter-app 核心模块 - 基于 shared_preferences.dart 的本地数据存储
// 开发者：zbc
// 创建时间：2021-??-??
// 上次维护时间：2021-07-21
// =======================================
import 'package:shared_preferences/shared_preferences.dart';
// ==========================================================================
// request_type          网络请求模式 uri || url_port
// http_type             网络请求协议 http || https
// url                   网络请求地址 xxx.xxx.xxx.xxx
// port                  网络请求端口 xxxxx
// uri                   网络请求直链地址 www.baidu.com
// userName              用户名
// password              密码
// ==========================================================================

class LocalStorage {
  // 保存数据
  static Future setValue(String key, String value) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future getValue(String key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }
}
