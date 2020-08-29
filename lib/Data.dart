import 'dart:ui';
import 'package:employment/Variable.dart';
import 'package:flutter/material.dart';




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
  String _intentionalityJob1;
  String _intentionalityJob2;
  String _intentionalityJob3;
  String _phone;
  String _qq;
  String _skill;
  String _location;
  String _company;
  int _salary;
  String _failedCourses;

  int  _index;


  TransferDataEntity( this._sno,this._sname,this._status,this._intentionalityCity1,this._employmentOrientation,this._skill,this._location,this._company,this._index,this._intentionalityCity2,this._intentionalityCity3,this._intentionalityJob1,this._intentionalityJob2,this._intentionalityJob3);

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
    int n=widget.keyword[0]._index;
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
                        widget.keyword[n]._sname,
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
                   "意向目标："+ widget.keyword[n]._employmentOrientation,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "学号："+widget.keyword[n]._sno,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "意向地点："+widget.keyword[n]._intentionalityCity1+","
                    +widget.keyword[n]._intentionalityCity2+","
                    +widget.keyword[n]._intentionalityCity3,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "意向城市："+widget.keyword[n]._intentionalityJob1+","
                        +widget.keyword[n]._intentionalityJob2+","
                        +widget.keyword[n]._intentionalityJob3,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "技能："+widget.keyword[n]._skill,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "当前位置："+widget.keyword[n]._location,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    "就业公司："+widget.keyword[n]._company,
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
