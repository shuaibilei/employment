import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'Login/LoginPager.dart';
import 'Tabs.dart';

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  var status = prefs.getBool('status');
  runApp(
      MaterialApp(
//        home: status == true ? Tabs() : LoginPage(),
      home:Tabs(),
      //删除 DEBUG
        debugShowCheckedModeBanner: false,
  ));
}
