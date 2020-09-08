class Count {
  int code;
  String message;
  List<Date> date;

  Count({this.code, this.message, this.date});

  Count.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['date'] != null) {
      date = new List<Date>();
      json['date'].forEach((v) {
        date.add(new Date.fromJson(v));
      });
    }else{
      date=null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.date != null) {
      data['date'] = this.date.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Date {
  String employmentOrientation;
  int count;

  Date({this.employmentOrientation, this.count});

  Date.fromJson(Map<String, dynamic> json) {
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