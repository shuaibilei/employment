import 'package:employment/Card.dart';
import 'package:flutter/material.dart';

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
      ),
      body:InfoList()
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: TextField(

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
  @override
  _InfoListState createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {

  List infoList = [
    Item("张三", "就业"),
    Item("李四", "考研"),
    Item("二哈", "无"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业"),
    Item("张三", "就业")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: infoList.length,
        itemBuilder: (context, index) {
//          return ListTile(
//            title: Text(infoList[index].name),
//            subtitle: Text(infoList[index].status),
//          );
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
            title: Text(infoList[index].name),
            subtitle: Text(infoList[index].status)
        ),
      ),
      onTap: (){
        showDialog<void>(
          context: context,
//          barrierDismissible: barrierDismissible,
          // false = user must tap button, true = tap outside dialog
          builder: (BuildContext dialogContext) {
            return SimpleDialog(
                title: Text("SimpleDialog"),
                titlePadding: EdgeInsets.all(10),
                backgroundColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))
                ),
              children: <Widget>[
                Text("姓名：${infoList[index].name}"),
                Text("学号："),
                Text("专业："),
                Text("就业情况："),
              ],
            );
          },
        );
      },
    );
  }
}

class Item{
  String name;
  String status;
  Item(this.name, this.status);
}


