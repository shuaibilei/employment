import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart'as http;
import 'package:employment/Variable.dart';
import 'package:employment/asset.dart';
import 'package:flutter/material.dart';

import 'intentjson.dart';



class TransferDataEntity {

  int _id;
  String _sno;
  String _sname;
  int _academyId;
  int _educationBackground;
  int _majorId;
  int _status;
  String _employmentOrientation;
  String _intentionalityCity1;
  String _intentionalityCity2;
  String _intentionalityCity3;
  int _intentionalityJob1;
  int _intentionalityJob2;
  int _intentionalityJob3;
  String _phone;
  String _qq;
  String _skill;
  String _location;
  String _company;
  int _salary;
  String _failedCourses;




  TransferDataEntity( this._sno,this._sname,this._status,this._intentionalityCity1,this._employmentOrientation,this._skill,this._location,this._company);

}
class InfoDialog extends StatefulWidget {
 final List<TransferDataEntity> keyword;

  InfoDialog({Key key, @required this.keyword}) : super(key: key);




  @override
  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Opacity(
              opacity: 0.01,
              child: Container(
                width: 500.0,
                height: 700.0,
                decoration: BoxDecoration(color: Colors.grey.shade200), //盒子修饰器
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
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.keyword[0]._sname,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            child: Icon(
                              Icons.clear,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                showGlass = false;
                                print("${showGlass}");
                              });
                            }),
                      ),
                    ],
                  ),
                  Text(
                   "学历："+ widget.keyword[0]._employmentOrientation,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "学号："+widget.keyword[0]._sno,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "地点："+widget.keyword[0]._intentionalityCity1,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "职业："+widget.keyword[0]._skill,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "工作地点："+widget.keyword[0]._location,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "公司："+widget.keyword[0]._company,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
