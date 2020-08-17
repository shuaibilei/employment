import 'package:flutter/material.dart';

class BarCard extends StatelessWidget {

  double widthOfCard;
  double heightOfCard;
  String category;

  BarCard({this.widthOfCard, this.heightOfCard, this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 10),
        child: SizedBox(
          height: heightOfCard,
          width: widthOfCard,
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
                      "今年${category}人数同去年相比：",
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
                            child: Text("今年：390人"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              height: 30,
                              width: widthOfCard,
                              decoration: ShapeDecoration(
                                  color: category=="就业" ? Colors.blue : Colors.deepOrange,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text("去年：390人"),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                                )
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
