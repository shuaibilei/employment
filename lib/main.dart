
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'Login/LoginPager.dart';

import 'Tabs.dart';
//
void main() => runApp(new MyApp());
//Future<void> main() async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  var email = prefs.getString('usename');
//  print(email);
//  runApp(MaterialApp(home: email == null ? MyApp1() : MyApp()));}
//void main(){
//  String email = null;
//  if(email  ==   null){
//    runApp(new MyApp1());
//  }
//  else{
//    runApp(new MyApp());
//  }}

//void main() {
//  runApp(MyApp1());
//  if (Platform.isAndroid) {
//    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle =
//    SystemUiOverlayStyle(
//        statusBarColor: Colors.transparent,
//        statusBarIconBrightness: Brightness.dark
//    );
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//
//  }
//}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Tabs(),

    );
  }
}

class MyApp1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_LoginPlugin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }

}

