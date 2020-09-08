import 'package:dio/dio.dart';
import 'package:employment/Json/City.dart';
import 'package:employment/count.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class BarOfNumberAndYear {
  final int year;
  final int number;

  BarOfNumberAndYear({this.year, this.number});
}

class BarOfDirectionAndNumber {
  final String direction;
  final int number;

  BarOfDirectionAndNumber({this.direction, this.number});
}

class BarOfCityAndNumber {
  final String city;
  final int number;

  BarOfCityAndNumber({this.city, this.number});
}

class PieOfCompanyAndNumber {
  final String company;
  final int number;

  PieOfCompanyAndNumber({this.company, this.number});
}

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> with TickerProviderStateMixin {
  TabController _tabController;
  Count list;
  City list1;
 Future<Count> getData() async{
   Dio dio = Dio();
   Response res = await dio.get('http://thesecondclass.linaxhua.cn/api/Intention/intention');
   print(1);
  if (res.statusCode == 200) {
    print(1);
  return Count.fromJson(res.data);
  } else {
  Future.error("请求失败");
  }
}
Future<City> getCity() async{
    Dio dio = Dio();
    Response res = await dio.get('http://thesecondclass.linaxhua.cn/api/Intention/city?grade=17&academyNum=003&majorId=0&mark=0&order=1');
    print(1);
    if (res.statusCode == 200) {
      print(1);
      return City.fromJson(res.data);
    } else {
      Future.error("请求失败");
    }
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    getData().then((l){
      list= l  ;
      setState(() {
      });
    }).catchError((e){

      setState(() {});
    });
    getCity().then((v){
      list1=v;
      setState(() {
      });
    }).catchError((e){

      setState(() {});
    });
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = list?.date==null? 0 : (list.date[0]?.count??0);
    int count1 = list?.date==null? 0 : (list.date[0]?.count??0);
    int count2 = list?.date==null? 0 : (list.date[2]?.count??0);
    int count3 = list?.date==null? 0 : (list.date[3]?.count??0);
    String city = list1?.data==null? "暂无" : (list1.data[0]?.intentionalityCity1??"暂无");
    String city1 = list1?.data==null? "暂无" : (list1.data[1]?.intentionalityCity1??"暂无");
    String city2 = list1?.data==null? "暂无" : (list1.data[2]?.intentionalityCity1??"暂无");
    String city3 = list1?.data==null? "暂无" : (list1.data[3]?.intentionalityCity1??"暂无");
    String city4 = list1?.data==null? "暂无" : (list1.data[4]?.intentionalityCity1??"暂无");
    String city5 = list1?.data==null? "暂无" : (list1.data[5]?.intentionalityCity1??"暂无");
    String city6 = list1?.data==null? "暂无" : (list1.data[6]?.intentionalityCity1??"暂无");
    String city7 = list1?.data==null? "暂无" : (list1.data[7]?.intentionalityCity1??"暂无");
    String city8 = list1?.data==null? "暂无" : (list1.data[8]?.intentionalityCity1??"暂无");
    String city9 = list1?.data==null? "暂无" : (list1.data[9]?.intentionalityCity1??"暂无");
    String city10 = list1?.data==null? "暂无" : (list1.data[10]?.intentionalityCity1??"暂无");
    int num = list1?.data==null? 0 : (list1.data[0]?.count??0);
    int num1 = list1?.data==null? 0 : (list1.data[1]?.count??0);
    int num2= list1?.data==null? 0 : (list1.data[2]?.count??0);
    int num3 = list1?.data==null? 0 : (list1.data[3]?.count??0);
    int num4 = list1?.data==null? 0 : (list1.data[4]?.count??0);
    int num5 = list1?.data==null? 0 : (list1.data[5]?.count??0);
    int num6 = list1?.data==null? 0 : (list1.data[6]?.count??0);
    int num7 = list1?.data==null? 0 : (list1.data[7]?.count??0);
    int num8 = list1?.data==null? 0 : (list1.data[8]?.count??0);
    int num9 = list1?.data==null? 0 : (list1.data[9]?.count??0);


    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 80.0,
              floating: true,
              pinned: true,
              snap: true,
              backgroundColor: Colors.white70,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("数据可视化",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverPersistentHeaderDelegate(TabBar(
                  controller: _tabController,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "就业"),
                    Tab(text: "考研"),
                  ])),
            )
          ];
        },
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      child: BarChart(
                        category: "就业",count:count
                      ),
                    ),
                    Container(
                      child: BarChart(
                        category: "考研",count:count2
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width/2 - 16,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              shadowColor: Colors.black,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("毕业总人数：",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                    Text((count+count1+count2+count3).toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    Text("已有方向人数：",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    Text(
                                      (count+count1+count2).toString(),

                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    Text("同去年同期相比：",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    Text("增长 7 人",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                height: 110,
                                width: MediaQuery.of(context).size.width/2 - 16,
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  shadowColor: Colors.black,
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("就业考研比例：",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500
                                          ),),
                                        Text(
                                          (count/count2).toString()
                                          , style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  height: 110,
                                  width: MediaQuery.of(context).size.width/2 - 16,
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("已确定方向占比：",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500
                                            ),),
                                          Text(
                                            ((count+count1+count2)/(count+count1+count2+count3)).toString(),
                                             style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 40),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "就业/考研方向",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      height: 250,
                      child: DoubleHorizontalBarChart(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 40),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "就业城市",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      height: 350,
                      child: HorizontalBarChart(city1: city,num1:num,
                        city2: city1,num2:num1,
                        city3: city2,num3:num2,
                        city4: city3,num4:num3,
                        city5: city4,num5:num4,
                        city6: city5,num6:num5,
                        city7: city6,num7:num6,
                        city8: city7,num8:num7,
                        city9: city8,num9:num8,
                        city10: city9,num10:num9,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 40),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "大厂人数",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      height: 300,
                      width: 330,
                      child: Align(
                          alignment: Alignment.centerRight, child: PieChart()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverPersistentHeaderDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
      color: Colors.white70,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

/////////////////竖状条形图//////////////////

class BarChart extends StatelessWidget {
  String category;
  int count;

  BarChart({this.category,this.count});

  final List<BarOfNumberAndYear> data = [
    BarOfNumberAndYear(year: 2015, number: 0),
    BarOfNumberAndYear(year: 2016, number: 0),
    BarOfNumberAndYear(year: 2017, number: 0),
    BarOfNumberAndYear(year: 2018, number: 0),
    BarOfNumberAndYear(year: 2019, number: 20)
  ];

  _getSeriesData() {
    List<charts.Series<BarOfNumberAndYear, String>> series = [
      charts.Series(
          id: "BarOfNumberAndYear",
          data: data,
          domainFn: (BarOfNumberAndYear series, _) => series.year.toString(),
          measureFn: (BarOfNumberAndYear series, _) => series.number,
          labelAccessorFn: (BarOfNumberAndYear series, _) =>
              series.number.toString(),
          colorFn: (_, __) => category == "就业"
              ? charts.MaterialPalette.blue.shadeDefault
              : charts.MaterialPalette.deepOrange.shadeDefault),
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("今年", style: TextStyle(color: Colors.grey)),
                    Text("${count}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("2019年",
                        style: TextStyle(color: Colors.grey, fontSize: 15))
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(left: 8, right: 8),
            child: charts.BarChart(
              _getSeriesData(),
              animate: true,
              barRendererDecorator: new charts.BarLabelDecorator(),
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////横状条形图//////////////////

class DoubleHorizontalBarChart extends StatelessWidget {
  final List<BarOfDirectionAndNumber> data1 = [
    BarOfDirectionAndNumber(direction: "专业相关", number: 400),
    BarOfDirectionAndNumber(direction: "专业无关", number: 300),
  ];

  final List<BarOfDirectionAndNumber> data2 = [
    BarOfDirectionAndNumber(direction: "专业相关", number: 100),
    BarOfDirectionAndNumber(direction: "专业无关", number: 50),
  ];

  _getSeriesData() {
    List<charts.Series<BarOfDirectionAndNumber, String>> series = [
      charts.Series(
          id: "就业",
          data: data1,
          domainFn: (BarOfDirectionAndNumber series, _) =>
              series.direction.toString(),
          measureFn: (BarOfDirectionAndNumber series, _) => series.number,
          labelAccessorFn: (BarOfDirectionAndNumber series, _) =>
              series.number.toString(),
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault),
      charts.Series(
          id: "考研",
          data: data2,
          domainFn: (BarOfDirectionAndNumber series, _) =>
              series.direction.toString(),
          measureFn: (BarOfDirectionAndNumber series, _) => series.number,
          labelAccessorFn: (BarOfDirectionAndNumber series, _) =>
              series.number.toString(),
          colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault),
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: charts.BarChart(
        _getSeriesData(),
        animate: false,
        barGroupingType: charts.BarGroupingType.grouped,
        vertical: false,
        barRendererDecorator: new charts.BarLabelDecorator(),
        behaviors: [
          new charts.SeriesLegend(position: charts.BehaviorPosition.end)
        ],
      )),
    );
  }
}

class HorizontalBarChart extends StatelessWidget {
  String city1;
  String city2;
  String city3;
  String city4;
  String city5;
  String city6;
  String city7;
  String city8;
  String city9;
  String city10;
  int num1;
  int num2;
  int num3;
  int num4;
  int num5;
  int num6;
  int num7;
  int num8;
  int num9;
  int num10;
  HorizontalBarChart({this.city1,this.num1,this.city2,this.num2
    ,this.city3,this.num3
    ,this.city4,this.num4
    ,this.city5,this.num5
    ,this.city6,this.num6
    ,this.city7,this.num7
    ,this.city8,this.num8
    ,this.city9,this.num9
    ,this.city10,this.num10});



  @override
  Widget build(BuildContext context) {

    final List<BarOfCityAndNumber> data = [
      BarOfCityAndNumber(city: city1, number: num1),
      BarOfCityAndNumber(city: city2, number: num2),
      BarOfCityAndNumber(city: city3, number: num3),
      BarOfCityAndNumber(city: city4, number: num4),
      BarOfCityAndNumber(city: city5, number: num5),
      BarOfCityAndNumber(city: city6, number: num6),
      BarOfCityAndNumber(city: city7, number: num7),
      BarOfCityAndNumber(city: city8, number: num8),
      BarOfCityAndNumber(city: city9, number: num9),
      BarOfCityAndNumber(city: city10, number: num10),
    ];

    _getSeriesData() {
      List<charts.Series<BarOfCityAndNumber, String>> series = [
        charts.Series(
            id: "BarOfNumberAndYear",
            data: data,
            domainFn: (BarOfCityAndNumber series, _) => series.city.toString(),
            measureFn: (BarOfCityAndNumber series, _) => series.number,
            labelAccessorFn: (BarOfCityAndNumber series, _) =>
                series.number.toString(),
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault),
      ];
      return series;
    }
    return Scaffold(
        body: Container(
      child: charts.BarChart(
        _getSeriesData(),
        animate: false,
        barRendererDecorator: new charts.BarLabelDecorator(),
      ),
    ));
  }
}

////////////////饼图////////////////////////

class PieChart extends StatelessWidget {
  final List<PieOfCompanyAndNumber> data = [
    PieOfCompanyAndNumber(company: "华为", number: 3),
    PieOfCompanyAndNumber(company: "腾讯", number: 2),
    PieOfCompanyAndNumber(company: "阿里", number: 1),
    PieOfCompanyAndNumber(company: "字节跳动", number: 4),
  ];

  _getSeriesData() {
    List<charts.Series<PieOfCompanyAndNumber, String>> series = [
      charts.Series(
        id: "BarOfNumberAndYear",
        data: data,
        domainFn: (PieOfCompanyAndNumber series, _) =>
            series.company.toString(),
        measureFn: (PieOfCompanyAndNumber series, _) => series.number,
        labelAccessorFn: (PieOfCompanyAndNumber series, _) =>
            '${series.company}:${series.number}人',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: charts.PieChart(_getSeriesData(),
                animate: true,
//                defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
//                  new charts.ArcLabelDecorator(
//                      labelPosition: charts.ArcLabelPosition.outside)
//                ])
                defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 60,
                    arcRendererDecorators: [new charts.ArcLabelDecorator()])),
          )
        ],
      ),
    );
  }
}

/////////////////折线图//////////////////////

class DoubleLineChart extends StatelessWidget {
  int Count;
  DoubleLineChart({this.Count});

  final List<BarOfNumberAndYear> data1 = [
    BarOfNumberAndYear(year: 2015, number: 300),
    BarOfNumberAndYear(year: 2016, number: 320),
    BarOfNumberAndYear(year: 2017, number: 350),
    BarOfNumberAndYear(year: 2018, number: 400),
    BarOfNumberAndYear(year: 2019, number: 200)
  ];
  final List<BarOfNumberAndYear> data2 = [
    BarOfNumberAndYear(year: 2015, number: 310),
    BarOfNumberAndYear(year: 2016, number: 360),
    BarOfNumberAndYear(year: 2017, number: 340),
    BarOfNumberAndYear(year: 2018, number: 410),
    BarOfNumberAndYear(year: 2019, number: 300)
  ];

  final customTickFormatter = charts.BasicNumericTickFormatterSpec((num value) {
    return "${value}年";
  });

  _getSeriesData() {
    List<charts.Series<BarOfNumberAndYear, int>> series = [
      charts.Series(
          id: "就业",
          data: data1,
          domainFn: (BarOfNumberAndYear series, _) => series.year,
          measureFn: (BarOfNumberAndYear series, _) => series.number,
//          labelAccessorFn: (BarOfNumberAndYear series, _) =>
//              series.number.toString(),
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault),
      charts.Series(
        id: "考研",
        data: data2,
        domainFn: (BarOfNumberAndYear series, _) => series.year,
        measureFn: (BarOfNumberAndYear series, _) => series.number,
//          labelAccessorFn: (BarOfNumberAndYear series, _) =>
//              series.number.toString(),
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      ),
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: charts.LineChart(
          _getSeriesData(),
          animate: true,
          domainAxis: new charts.NumericAxisSpec(
            viewport: new charts.NumericExtents(2015, 2019),
            tickFormatterSpec: customTickFormatter,
          ),
          primaryMeasureAxis: new charts.NumericAxisSpec(
            viewport: new charts.NumericExtents(250.0, 450.0),
          ),
          behaviors: [
            new charts.SeriesLegend(
              // 图例位置 在左侧start 和右侧end
              position: charts.BehaviorPosition.end,
              // 图例条目  [horizo​​ntalFirst]设置为false，图例条目将首先作为新行而不是新列增长
              horizontalFirst: false,
              // 每个图例条目周围的填充Padding
              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
              // 显示度量
              showMeasures: true,
              // 度量格式
              measureFormatter: (num value) {
                return value == null ? '-' : '${value}人';
              },
            ),
          ],
        ),
      ),
    );
  }
}
