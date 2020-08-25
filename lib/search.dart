
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Data.dart';
import 'asset.dart';
import 'intentjson.dart';

/////搜索结果//////
class searchResult extends StatefulWidget {
  String keyword;
  searchResult({Key key, this.keyword}) : super(key: key);
  _searchResultState createState() => _searchResultState();
}

class _searchResultState extends State<searchResult> {
  Intentjson list;
  String error;
  bool loading;



  Future<Intentjson>searult()async{
    Map<String,dynamic>param={
      "keyword": widget.keyword,///传入的值
      "academyId": 0,
      "educationBackground": 0,
      "majorId": 0,
      "intentionalityCity": "string",
      "intentionalityJob": 0,
      "mixSalary": 0,
      "maxSalary": 0,
      "sort": 0,
      "pageSize": 0,
      "page": 0
    };
      final http.Response response =await http.put('http://thesecondclass.linaxhua.cn/api/Intention/query',
          body:param,
          encoding: Utf8Codec()
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);

    if(response.statusCode==200){
      return Intentjson.fromJson(response.body);
    }else{
      Future.error("请求失败");
    }
  }

  @override
  void initState() {
    loading=true;
    // TODO: implement initState
    super.initState();

    searult().then((v){
      list=v  ;
      loading=false;
      error=false;
      setState(() {
      });
    }).catchError((e){
    error=true;
    loading=false;
    setState(() {
    });
    });
  }
  void reset(){
    loading=true;
    error=false;
  }

  @override
  Widget build(BuildContext context) {
  return loading ? Center(child: CircularProgressIndicator())
      : ListView.separated(
      itemCount: list.data.length,
      itemBuilder: (context, index) {
        return getItem(index);

      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.blue);
      }
  );
  }


  Widget getItem(int index){
    return GestureDetector(
      child: Container(

        child: ListTile(
            title: Text(list.data[index].sname),
            subtitle: Text(list.data[index].company)
        ),
      ),
      onTap: (){
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
                      child: ( InfoDialog(
                        ////////传输数据到InfoDialog
                        keyword:List.generate(list.data.length, (index) => TransferDataEntity(list.data[index].sno.toString(),
                            list.data[index].sname,
                            list.data[index].status,
                            list.data[index].intentionalityCity1,
                            list.data[index].employmentOrientation,
                            list.data[index].skill,
                            list.data[index].location,
                            list.data[index].company)),
                      )
                      )
                  ));
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
         new Row(
           children: [
            Text('历史记录', style: TextStyle(fontSize: 16)),
             IconButton(
               icon: Icon(
                 Icons.delete_outline,
                 color: Colors.grey,
               ),
               onPressed: () {
                 showDialog(
                     context: context,
                     builder: (context) {
                       return AlertDialog(
                         content: Text(
                           "确定清空全部历史记录？",
                         ),
                         actions: <Widget>[
                           FlatButton(
                             onPressed: () {
                               Navigator.of(context).pop();
                             },
                             child: Text('取消'),
                             textColor: Colors.red,
                           ),
                           FlatButton(
                             onPressed: () {
                               items.clear();
                               Navigator.of(context).pop();
                             },
                             child: Text('清空'),
                             textColor: Colors.red,
                           ),
                         ],
                       );
                     });
               },
             )
],
          ),
          SearchItemView()
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
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

////////热词搜索///////////



class hotSearch extends StatefulWidget {
  hotSearch({Key key}) : super(key: key);

  _hotSearchState createState() => _hotSearchState();
}

class _hotSearchState extends State<hotSearch> {
List data=[];
  getData() async {
    Dio dio = new Dio();
    Response res = await dio.get(
//        'http://thesecondclass.linaxhua.cn/api/academy/findAll?page=1&pagesize=8'
    'https://c.y.qq.com/splcloud/fcgi-bin/gethotkey.fcg?g_tk=5381&uin=0&notice=0&platform=h5&needNewCode=1&_=1513317614040'
    );
    var hotkey = json.decode(res.data)['data']['hotkey'];
    print(hotkey);
    setState(() {
       data = hotkey;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();

  }

  @override
  Widget build(BuildContext context) {
    print(data.length);
    print('nihao');
    print(data);
    return ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]['k']),
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return Divider(color: Colors.blue);
        }
    );
  }
}
