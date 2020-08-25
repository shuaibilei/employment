

import 'package:employment/search.dart';

import 'package:flutter/material.dart';

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
      return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) =>
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
