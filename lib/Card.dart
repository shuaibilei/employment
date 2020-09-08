import 'package:flutter/material.dart';


class BarCard extends StatelessWidget {
  double widthOfCard;
  double heightOfCard;
  String category;
  Color color;
  int count;
  int count2;


  BarCard({this.widthOfCard, this.heightOfCard, this.category,this.count, this.count2, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 10),
        child: SizedBox(
          height: heightOfCard,
          width: widthOfCard = MediaQuery.of(context).size.width - 16,
          child: Card(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            shadowColor: Colors.black,
            elevation: 30,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "今年$category人数同去年相比：",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text("今年：${count}人"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              height: 30,
                              width: count>count2 ? MediaQuery.of(context).size.width - 48 : (MediaQuery.of(context).size.width - 48)*(count/count2),
                              decoration: ShapeDecoration(
                                  color: color,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text("去年：${count2}人"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              height: 30,
                              width: count<count2 ? MediaQuery.of(context).size.width - 48 : (MediaQuery.of(context).size.width - 48)*(count2/count),
                              decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


class PieCard extends StatelessWidget {

  double widthOfCard;

  PieCard({this.widthOfCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      decoration: ShapeDecoration(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ))),

    );
  }
}
