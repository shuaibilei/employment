class Count {
  int code;
  String message;
  List<Data> data;

  Count({this.code, this.message, this.data});

  factory Count.fromJson(Map<String, dynamic> json) {

    var accJson=json["data"]as List;
    List<Data>accList=accJson.map((i)=>Data.fromJson(i)).toList();



//      json['data'].forEach((v) {
//        data.add(new Data.fromJson(v));
//      });

    return Count(
        data: accList
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String employmentOrientation;
  int count;

  Data({this.employmentOrientation, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    employmentOrientation = json['employmentOrientation'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employmentOrientation'] = this.employmentOrientation;
    data['count'] = this.count;
    return data;
  }
}