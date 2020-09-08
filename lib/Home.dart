import 'dart:convert';
import 'package:employment/Card.dart';
import 'package:employment/Chart.dart';
import 'package:employment/Person.dart';
import 'package:employment/searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


import 'Json/Future.dart';
import 'future/Count.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Count list;
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


  }


  @override
  Widget build(BuildContext context) {
    int count = list?.data==null? 0 : (list.data[0]?.count??0);
    int count1 = list?.data==null? 0 : (list.data[1]?.count??0);
    int count2 = list?.data==null? 0 : (list.data[2]?.count??0);
    int count3 = list?.data==null? 0 : (list.data[3]?.count??0);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        //下层高度
        height: 1300,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1000,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 100.0, right: 8, left: 8, top: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 130,
//                      color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "欢迎回来",
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "王老师",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Container(
                                child: IconButton(
                                    icon: Icon(Icons.person),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Pearson(),
                                        ),
                                      );
                                    }),

                              ),
                            ),
                            Container(
                              child: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                    showSearch(
                                        context: context,
                                        delegate: SearchBarView());
                                  }),

                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 200,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: (
                                  Text("本数据于 2019 年 9 月更新")
                              ),
                            ),
                          ),
                          Container(
                            child: DropdownButton(
                              items: <DropdownMenuItem<String>>[
                                DropdownMenuItem(child: Text("计算机与信息安全"),),
                                DropdownMenuItem(child: Text("机电"),),
                              ],
                              hint: Text("选择专业"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                //上层高度
                height: 1100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, -1),
                          blurRadius: 10)
                    ]),
                child: Padding(
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
                                width: MediaQuery.of(context).size.width/2 - 16,
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
                                        Text("毕业总人数：",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        Text((count+count1+count2+count3).toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Text("已有方向人数：",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        Text(
                                          (count+count1+count2).toString(),

                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Text("同去年同期相比：",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        Text("增长 7 人",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 110,
                                    width: MediaQuery.of(context).size.width/2 - 16,
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
                                            Text("就业考研比例：",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                            Text(
                                              (count/count2).toStringAsFixed(2)
                                              , style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                      height: 110,
                                      width: MediaQuery.of(context).size.width/2 - 16,
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
                                              Text("已确定方向占比：",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500
                                                ),),
                                              Text(
                                                ((count+count1+count2)/(count+count1+count2+count3)).toStringAsFixed(2),
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),)
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
                        BarCard(category: "就业",count: count, count2: 300, color: Colors.blue,),
                        BarCard(category: "考研",count: count2, count2: 200, color: Colors.deepOrange,),
                        BarCard(category: "考公",count: count1, count2: 50, color: Colors.green,)
                      ],
                    )),
                  ),
                ),
              ),
            ),
          ],
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
