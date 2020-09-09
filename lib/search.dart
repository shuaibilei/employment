import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Data.dart';
import 'asset.dart';
import 'intentjson.dart';

var searchClass = [
  "学号",
  "姓名",
  "学院",
  "意向城市",
  "意向职业"
];

/////搜索结果//////
class searchResult extends StatefulWidget {
  String keyword;

  searchResult({Key key, this.keyword}) : super(key: key);

  _searchResultState createState() => _searchResultState();
}

class _searchResultState extends State<searchResult> {
  Intentjson list;
  bool error;
  bool loading;

  Future<Intentjson> searult() async {
    items.add(widget.keyword);
    Map<String, dynamic> param = {
      "keyword": widget.keyword,
      ///传入的值
      "academyId": 0,
      "educationBackground": 0,
      "majorId": 0,
      "intentionalityCity": "string",
      "intentionalityJob": 0,
      "mixSalary": 0,
      "maxSalary": 0,
      "sort": 0,
      "pageSize": 500,
      "page": 1
    };
    Dio dio = Dio();
    final Response response = await dio.put('http://thesecondclass.linaxhua.cn/api/Intention/query', data: param);
    if (response.statusCode == 200) {
      return Intentjson.fromJson(response.data);
    } else {
      Future.error("请求失败");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
    searult().then((v) {
      list = v;
      loading = false;
      error = false;
      setState(() {});
    }).catchError((e) {
      error = true;
      loading = false;
      setState(() {});
    });
  }

  void reset() {
    loading = true;
    error = false;
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
        itemCount: list?.data?.rows?.length ?? 0,
        itemBuilder: (context, index) {
          return getItem(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.blue);
        });
  }

  Widget getItem(int index) {
    return GestureDetector(
      child: Container(
        child: ListTile(
            title: Text(list.data?.rows[index].sname ?? ""),
            subtitle: Text(
                acadmy(list.data?.rows[index].academyId ?? "")+"\n"
                    +majoy(list.data?.rows[index].majorId ?? "")
            ),

        ),
      ),
      onTap: () {
        showGeneralDialog(
            context: context,
            pageBuilder: (context, anim1, anim2) {},
            barrierDismissible: false,
            barrierLabel: "",
            transitionDuration: Duration(milliseconds: 250),
            transitionBuilder: (context, anim1, anim2, child) {
              return Transform.scale(
                  scale: anim1.value,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: (InfoDialog(
                        ////////传输数据到InfoDialog
                        keyword: List.generate(
                            list.data?.rows?.length ?? 0,
                                (n) => TransferDataEntity(
                                list.data?.rows[n].sno ?? "".toString(),
                                list.data?.rows[n].sname ?? "",
                                list.data?.rows[n].status ?? "",
                                list.data?.rows[n].intentionalityCity1 ?? "",
                                list.data?.rows[n].employmentOrientation ?? "",
                                list.data?.rows[n].skill ?? "",
                                list.data?.rows[n].location ?? "",
                                list.data?.rows[n].company ?? "",
                                index ?? "",
                                  list.data?.rows[n].intentionalityCity2 ?? "",
                                  list.data?.rows[n].intentionalityCity3 ?? "",
                                  list.data?.rows[n].intentionalityJob1 ?? "",
                                  list.data?.rows[n].intentionalityJob2 ?? "",
                                  list.data?.rows[n].intentionalityJob3 ?? "",),
                      )))));
            });
      },
    );
  }
}

///////////历史记录///////////
class SearchContentView extends StatefulWidget {
  @override
  _SearchContentViewState createState() => _SearchContentViewState();
}

class _SearchContentViewState extends State<SearchContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
//            height: 100,
            width: double.infinity,
//            color: Colors.blue,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("指定内容搜索",
                    style: TextStyle(
                      color: Colors.grey[400]
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      for(var i = 0; i < searchClass.length; i++)
                        if(i<3)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(searchClass[i],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent
                          ),
                        ),
                      ),

                    ],

                  ),
                ),

                Container(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for(var i = 0; i < searchClass.length; i++)
                        if(i>=3)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(searchClass[i],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
//          new Row(
//            children: [
//              Text('历史记录', style: TextStyle(fontSize: 16)),
//              IconButton(
//                icon: Icon(
//                  Icons.delete_outline,
//                  color: Colors.grey,
//                ),
//                onPressed: () {
//                  showDialog(
//                      context: context,
//                      builder: (context) {
//                        return AlertDialog(
//                          content: Text(
//                            "确定清空全部历史记录？",
//                          ),
//                          actions: <Widget>[
//                            FlatButton(
//                              onPressed: () {
//                                Navigator.of(context).pop();
//                              },
//                              child: Text('取消'),
//                              textColor: Colors.red,
//                            ),
//                            FlatButton(
//                              onPressed: () {
//                                items.clear();
//                                Navigator.of(context).pop();
//                              },
//                              child: Text('清空'),
//                              textColor: Colors.red,
//                            ),
//                          ],
//                        );
//                      });
//                },
//              )
//            ],
//          ),
//          SearchItemView()
        ],
      ),
    );
  }
}

class SearchItemView extends StatefulWidget {
  @override
  _SearchItemViewState createState() => _SearchItemViewState();
}

class _SearchItemViewState extends State<SearchItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10,
        // runSpacing: 0,
        children: items.map((item) {
          return SearchItem(title: item);
        }).toList(),
      ),
    );
  }
}

class SearchItem extends StatefulWidget {
  @required
  final String title;

  const SearchItem({Key key, this.title}) : super(key: key);

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(widget.title),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onTap: () {
          ///////TODO:点击值传入输入栏中
          print(widget.title);
        },
      ),
      color: Colors.white,
    );
  }
}

//Future<Intentjson>Data()async{
//
//  var res= await http.get(
//      'http://thesecondclass.linaxhua.cn/api/Intention/queryBySno?sno=$word'
//  );
//  if(res.statusCode==200){
//    print(jsonDecode(res.body)['data']);
//    return Intentjson.fromJson(jsonDecode(res.body));
//
//  }else{
//    Future.error("请求失败");
//  }
//}
String acadmy(int value){
  switch (value){
    case 1:
    return ("机电工程学院");
    break;
    case 2:
      return ("信息与通信学院");
      break;
    case 3:
      return ("计算机与信息安全学院");
      break;
    case 4:
      return ("艺术与设计学院");
      break;
      case 5:
    return ("商学院");
    break;
    case 6:
      return ("外国语学院");
      break;
    case 7:
      return ("数学与计算科学学院");
      break;
    case 8:
      return ("电子工程与自动化学院");
      break;
    case 9:
      return ("法学院");
      break;
    case 10:
      return ("材料科学与工程学院");
      break;
    case 12:
      return ("生命与环境科学学院");
      break;
    case 15:
      return ("建筑与交通工程学院");
      break;
    default:
      return ("不详");

  }
}

String majoy(int value){
  switch (value){
    case 13:
      return ("计算机类");
      break;
    case 14:
      return ("计算机科学与技术（卓越）");
      break;
    case 15:
      return ("计算机科学与技术");
      break;
    case 16:
      return ("软件工程");
      break;
    case 17:
      return ("信息安全");
      break;
    case 18:
      return ("信息对抗技术");
      break;
    case 19:
      return ("物联网工程");
      break;
    case 20:
      return ("智能科学与技术");
      break;
    default:
      return ("不详");

  }



}