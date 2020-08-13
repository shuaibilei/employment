import 'package:employment/search.dart';
import 'package:flutter/material.dart';

class SearchBarView extends SearchDelegate<String> {
  String searchHint = '请输入内容';
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
    return (hotSearch()
    );
  }

}