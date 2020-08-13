import 'package:flutter/material.dart';
import 'Home.dart';
import 'Data.dart';
import 'Chart.dart';

class Tabs extends StatefulWidget {
  @override
  _Tabs createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  int _currentIndex = 0;
  List _itemList = [
    Home(),
    Data(),
    Chart()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      body: this._itemList[this._currentIndex],
      body: Stack(

        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: _itemList[0],
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child:_itemList[1],
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child:_itemList[2],
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("添加")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("个人")
          )
        ],
      ),
    );
  }
}
