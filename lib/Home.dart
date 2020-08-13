import 'dart:convert';


import 'package:employment/Data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
          return InfoList(key:null,keyword: value);//////////////////获取数据////////////////////
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
  String keyword;
  InfoList({Key key, this.keyword}) : super(key: key);
  _InfoListState createState() => _InfoListState();
}



/////////////////////获取数据保存状态/////////////////////////////
class _InfoListState extends State<InfoList> with AutomaticKeepAliveClientMixin{
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
    return ListView.separated(
        itemCount: infoList.length,
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
      child: Container(

        child: ListTile(
            title: Text(infoList[index]['k']),
            subtitle: Text(infoList[index]['k'])
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
                Text("姓名：${infoList[index]["songname"]}"),
                Text("学号：${infoList[index]["songname_hilight"]}"),
                Text("专业：${infoList[index]["strMediaMid"]}"),
                Text("就业情况：${infoList[index]["stream"]}"),
              ],
);
},
);
},
);
}
}


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

class SearchBarView extends SearchDelegate<String> {
  String searchHint = '请输入内容';

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
    return hotSearch();
  }


}





