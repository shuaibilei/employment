import 'package:flutter/material.dart';
import 'Data.dart';
import 'dart:ui';
import 'Variable.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar()
      ),
      body:Stack(
        children: <Widget>[
          InfoList(),
          ],
      )
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
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        color: Colors.white,
        borderRadius: BorderRadius.all( Radius.circular(5.0)),
      ),
      alignment: Alignment.center,
      height: 38,
      child: TextField(
        decoration: InputDecoration(
          hasFloatingPlaceholder: false,
          prefixIcon: Icon(
            Icons.search
          ),
          hintText: "搜索",
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
    return Container(
      child: ListView.separated(
          itemCount: infoList.length,
          itemBuilder: (context, index) {
          return getItem(index);
          },
          separatorBuilder: (BuildContext context, int index){
            return Divider(color: Colors.blue);
          }
      ),
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

        setState(() {
          showGlass = true;
          print("${showGlass}");
        });

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

class Item{
  String name;
  String status;
  Item(this.name, this.status);
}


