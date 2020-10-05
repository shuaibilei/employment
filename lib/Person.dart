import 'package:employment/Login/LoginPager.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Pearson extends StatelessWidget {

//  Future logOut(BuildContext context) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setBool('status', false);
//    Navigator.of(context).pushAndRemoveUntil(
//        new MaterialPageRoute(builder: (context) => LoginPage()
//        ), (route) => route == null);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "个人",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.black,
          child: (Text("退出登录")),
          onPressed: () {
//            logOut(context);
          },
        ),
      ),
    );
  }
}
