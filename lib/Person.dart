import 'package:flutter/material.dart';

class Pearson extends StatelessWidget {
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
            print("sss");
          },
        ),
      ),
    );
  }
}
