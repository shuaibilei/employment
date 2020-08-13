import 'dart:ui';

import 'package:employment/Variable.dart';
import 'package:flutter/material.dart';


class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return InfoDialog();
  }
}

class InfoDialog extends StatefulWidget {
  @override
  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Opacity(
                opacity: 0.01,
                child: Container(
                  width: 500.0,
                  height: 700.0,
                  decoration:
                  BoxDecoration(color: Colors.grey.shade200), //盒子修饰器
                ),
              ),
            ),
          ),
        ),
        Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            height: 300,
            width: 300,
            decoration: ShapeDecoration(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ))),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 230),
                      child: (Text(
                      "张三",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      )),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        child: Icon(
                          Icons.clear,
                          color: Colors.blue,
                        ),
                        onTap:(){
                          Navigator.pop(context);
                          setState(() {
                            showGlass = false;
                            print("${showGlass}");
                          });
                        }
                      ),
                    ),
                  ],

                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: (Text(
                    "专业：软件工程",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: (Text(
                    "学号：18003003",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: (Text(
                    "毕业时间：2022",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: (Text(
                    "状态：就业",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: (Text(
                    "岗位：华为",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: (Text(
                    "地点：深圳",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),

    ]
    );
  }
}



