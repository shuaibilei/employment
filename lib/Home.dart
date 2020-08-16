import 'dart:convert';
import 'package:employment/search.dart';
import 'package:employment/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'json.dart';
import 'package:http/http.dart'as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBarView());
    }
          )
        ],
      ),
      body:InfoList()
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}
/////////////////搜索栏///////////////////////
class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: TextField(

        onSubmitted: (value) {

        },
        decoration: InputDecoration(
          hasFloatingPlaceholder: false,
          prefixIcon: Icon(
            Icons.search
          ),
          hintText: "搜索",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
              Radius.circular(10)
              )
            ),

            fillColor: Colors.grey
        ),
      ),
    );
  }
}


class InfoList extends StatefulWidget {

  _InfoListState createState() => _InfoListState();
}
/////////////////////获取数据保存状态/////////////////////////////
class _InfoListState extends State<InfoList> {
  List infoList = [];
  Json list;
  String error;
  bool loading;
  Future<Json> _loadData() async{
    var res=await http.get('http://thesecondclass.linaxhua.cn/api/academy/findAll?page=1&pagesize=8');
    if(res.statusCode == 200){
      return Json.fromJson(jsonDecode(res.body));
    }else{
      Future.error("网络访问失败");
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading =true;
    _loadData().then((v){
      list=v;
      loading=false;
      setState(() {
      });
    }).catchError((e){
      error=e;
      loading=false;

    });
  }
//////////////////////搜索栏Listview搭建//////////////////////////
  @override
  Widget build(BuildContext context) {

    return loading?Center(child: CircularProgressIndicator())
    :ListView.separated(

        itemCount: list.data.length,
        itemBuilder: (context, index) {
        return getItem(index);
        },
        separatorBuilder: (BuildContext context, int index){
          return Divider(color: Colors.blue);
        }
    );
  }
///////////////////////////点击弹出//////////////////////////////
  Widget getItem(int index){
    return GestureDetector(
      child: loading?Center(child: CircularProgressIndicator())
          :Container(

        child: ListTile(
            title: Text(list.data[index].name),
            subtitle: Text(list.data[index].details)
        ),
      ),
      onTap: (){
        showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return SimpleDialog(
                title: Text("学生信息"),
                titlePadding: EdgeInsets.all(10),
                backgroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))
                ),
              children: <Widget>[
                Text("学院id：${list.data[index].id}"),
                Text("学院num：${list.data[index].number}"),
              ],
      );
      },
      );
},
);
}
}









