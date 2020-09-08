class Employ {
  int code;
  String message;
  int count;
  List<Data> data;

  Employ({this.code, this.message, this.count, this.data});

  Employ.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    count = json['count'];
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
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String intentionalityJob1;
  int count;

  Data({this.intentionalityJob1, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    intentionalityJob1 = json['intentionality_job1'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intentionality_job1'] = this.intentionalityJob1;
    data['count'] = this.count;
    return data;
  }
}