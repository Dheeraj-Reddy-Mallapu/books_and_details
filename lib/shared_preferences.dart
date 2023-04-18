import 'package:shared_preferences/shared_preferences.dart';

String orderBy = 'modifiedAt';
bool descending = true;
String _orderByKey = 'orderByKey';
String _descendingKey = 'descendingKey';

Future<bool> setOrderBy(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(_orderByKey, value);
}

Future<String> getOrderBy() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  orderBy = prefs.getString(_orderByKey) ?? 'modifiedAt';
  return orderBy;
}

Future<bool> setDescending(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setBool(_descendingKey, value);
}

Future<bool> getDescending() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  descending = prefs.getBool(_descendingKey) ?? true;
  return descending;
}
