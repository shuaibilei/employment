import 'dart:convert';
import 'package:employment/Card.dart';
import 'package:employment/Chart.dart';
import 'package:employment/Person.dart';
import 'package:employment/searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


import 'Json/Future.dart';
import 'Variable.dart';
import 'Json/Time.dart';
import 'future/Count.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Count list;
  Time listtime;
  @override
  void initState() {
    super.initState();

    getData().then((l){
      list= l  ;
      setState(() {
      });
    }).catchError((e){

      setState(() {});
    });
    geteTime().then((l){
      listtime= l  ;
      setState(() {
      });
    }).catchError((e){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    int count = list?.data==null? 0 : (list.data[0]?.count??0);
    int count1 = list?.data==null? 0 : (list.data[1]?.count??0);
    int count2 = list?.data==null? 0 : (list.data[2]?.count??0);
    int count3 = list?.data==null? 0 : (list.data[3]?.count??0);
    String year =listtime?.year??"0";
    String month=listtime?.month??"0";
    String day=listtime?.date??"0";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
          title: Text("桂林电子科技大学就业系统",style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Colors.white70,
//          toolbarOpacity: 0.1,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.person),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Pearson(),
                    ),
                  );
                })
          ],
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
              child: Container(
                width: double.infinity,
                child: RaisedButton.icon(
                  color: Colors.grey[100],
                  icon: Icon(Icons.search),
                  label: Text("搜索"),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchBarView());
                  },
                ),
              ),
            ),
          )
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0, right: 8, left: 8, top: 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 20),
                          child: Container(
                            width: 200,
                            height: 50,
                            child: DropdownButton<String>(
                              //dropdownValue 在 Variable 文件
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_right),
                              iconSize: 40,
                              iconEnabledColor: Colors.black,
                              hint: Text("请选择专业"),
                              isExpanded: true,
                              underline: Container(height: 1, color: Colors.grey),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>['One', 'Two', '计算机与信息安全学院', 'Four']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      child: Column(
                    children: <Widget>[
//                        Container(height: 200, child: DoubleLineChart(Count: list?.date[0]?.count??"0",)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width / 2 - 16,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                shadowColor: Colors.black,
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                         "2019年",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "毕业总人数：",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 16.0),
                                        child: Text(
                                          (count + count1 + count2 + count3)
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "已有方向人数：",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        (count + count1 + count2).toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  height: 110,
                                  width:
                                      MediaQuery.of(context).size.width / 2 - 16,
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "就业考研比例：",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            (count / count2).toStringAsFixed(2),
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    height: 110,
                                    width: MediaQuery.of(context).size.width / 2 -
                                        16,
                                    child: Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      shadowColor: Colors.black,
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "已确定方向占比：",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              ((count + count1 + count2) /
                                                      (count +
                                                          count1 +
                                                          count2 +
                                                          count3))
                                                  .toStringAsFixed(2),
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      BarCard(
                        category: "就业",
                        count: count,
                        count2: 300,
                        color: Colors.blue,
                      ),
                      BarCard(
                        category: "考研",
                        count: count2,
                        count2: 200,
                        color: Colors.deepOrange,
                      ),
                      BarCard(
                        category: "考公",
                        count: count1,
                        count2: 50,
                        color: Colors.green,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: (Text("本数据于"+year+"年"+month+"月"+day+"更新")),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoList extends StatefulWidget {
  String keyword;

  InfoList({Key key, this.keyword}) : super(key: key);

  _InfoListState createState() => _InfoListState();
}

/////////////////////获取数据保存状态/////////////////////////////
class _InfoListState extends State<InfoList>
    with AutomaticKeepAliveClientMixin {
  List infoList = [];

  getData() async {
    Dio dio = new Dio();

    Response res = await dio.get(
        'https://c.y.qq.com/splcloud/fcgi-bin/gethotkey.fcg?g_tk=5381&uin=0&notice=0&platform=h5&needNewCode=1&_=1513317614040');
    print('key');
    var hotkey = json.decode(res.data)['data']['hotkey'];
    setState(() {
      infoList = hotkey;
    });
  }

////页面保持状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

//////////////////////搜索栏Listview搭建//////////////////////////
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container();
  }
///////////////////////////点击弹出//////////////////////////////

}
