
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';
///////搜索结果//////
class searchResult extends StatefulWidget {
  String keyword;
  searchResult({Key key, this.keyword}) : super(key: key);

  _searchResultState createState() => _searchResultState();
}
class _searchResultState extends State<searchResult> {
  List data = [];

  getData() async {
    Dio dio = new Dio();
    print(widget.keyword);
    String word = widget.keyword;
    Response res = await dio.get(
        'https://c.y.qq.com/soso/fcgi-bin/client_search_cp?g_tk=5381&p=1&n=20&w=$word&format=json');
    print('key');
    List songs = json.decode(res.data)['data']['song']['list'];
    setState(() {
      data = songs;
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
    return ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return getItem(index);
        },
        separatorBuilder: (BuildContext context, int index){
          return Divider(color: Colors.blue);
        }
    );
  }

  Widget getItem(int index){
    return GestureDetector(
      child: Container(

        child: ListTile(
            title: Text(data[index]["songname"]),
            subtitle: Text(data[index]["songname_hilight"])
        ),
      ),
      onTap: (){
        showGeneralDialog(
            context: context,
            pageBuilder: (context, anim1, anim2) {},
//            barrierColor:
            barrierDismissible: false,
            barrierLabel: "",
            transitionDuration: Duration(milliseconds: 250),
            transitionBuilder: (context, anim1, anim2, child) {
              return Transform.scale(
                  scale: anim1.value,
                  child: AnimatedContainer(
//                    opacity: anim1.value,
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: (
                          InfoDialog()
                      )
                  ));
            });
      },
    );
  }

}




////////热词搜索///////////



class hotSearch extends StatefulWidget {
  hotSearch({Key key}) : super(key: key);

  _hotSearchState createState() => _hotSearchState();
}

class _hotSearchState extends State<hotSearch> {
  List data = [];

  getData() async {
    Dio dio = new Dio();
    Response res = await dio.get(
        'https://c.y.qq.com/splcloud/fcgi-bin/gethotkey.fcg?g_tk=5381&uin=0&notice=0&platform=h5&needNewCode=1&_=1513317614040'
    );
    var hotkey = json.decode(res.data)['data']['hotkey'];
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