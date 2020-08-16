
import 'package:employment/search.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'asset.dart';

class SearchBarView extends SearchDelegate<String> {

////////清空按钮//////////
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

/////////////返回按钮/////////
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

////////搜索返回结果//////////////
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    return searchResult(
      keyword: query,
    );
  }

///////搜索栏无输入时状态/////////////
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return
        SearchContentView();
    }
    else {

      final suggestionList = searchList.where((input) =>
          input.startsWith(query)).toList();

      ////////////TODO:将数据传入suggtion

//      return Scaffold(
//          body: FutureBuilder<Json>(
//              future: _loadData(),
//              builder: ( context,snapshot) {
//                if(snapshot.connectionState == ConnectionState.done){
//                  print("lianjie");
//                  if(snapshot.hasData){
//                    print("nihao");
//                    var date = jsonDecode(snapshot.data.toString());
//                    List<Map> swiper = (date['data'] as List).cast();
//                    return ListView.builder(
//                        itemCount: swiper.length,
//                        itemBuilder: (BuildContext context, int index) {
//                          return InkWell(
////                            onTap: (){
////                              Navigator.of(context).push(
////                                  MaterialPageRoute(builder: (context)=>DetailPage(
////                                      eachVodId: List.of(data["data"])[index]['id'],
////                                      eachVodName:List.of(data["data"])[index]['vod_name'],
////                                      p:1
////
////                                  ))
////                              );
////                            },
//                            child:ListTile(title: Text("date.data")),
//                          );
//
//                        }
//                    );
//                  }else{
//                    return Center(child: Text("no datas"));
//                  }
//
//                }else{
//                  return Center(child: CircularProgressIndicator());
//                }
//
//              })
//      );
      return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (contex, index) =>
            ListTile(
                title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      //截取搜索的关键的长度
                      style: TextStyle( //截取的字给他一个黑色字体样式,并加粗
                          color: Colors.black, fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                            text: suggestionList[index].substring(query.length),
                            style: TextStyle(color: Colors.grey)
                        )
                      ]
                  ),
                ),
                onTap: () {
                  query = query + suggestionList[index].substring(query.length);
                }
            ),
      );
    }
  }


}