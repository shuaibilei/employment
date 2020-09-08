class Count {
  int code;
  String message;
  List<Data> data;

  Count({this.code, this.message, this.data});

  Count.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
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