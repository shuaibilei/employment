class City {
  int code;
  String message;
  int count;
  List<Data> data;

  City({this.code, this.message, this.count, this.data});

 factory City.fromJson(Map<String, dynamic> json) {


      var accJson=json["data"]as List;
      List<Data>accList=accJson.map((i)=>Data.fromJson(i)).toList();

      accList.sort((b,a){
        return a.count.compareTo(b.count);
      });

//      json['data'].forEach((v) {
//        data.add(new Data.fromJson(v));
//      });

      return City(
          data: accList
      );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String intentionalityCity1;
  int count;

  Data({this.intentionalityCity1, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    intentionalityCity1 = json['intentionalityCity1'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intentionalityCity1'] = this.intentionalityCity1;
    data['count'] = this.count;
    return data;
  }
}