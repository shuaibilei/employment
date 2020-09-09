class Employ {
  int code;
  String message;
  int count;
  List<Data> data;

  Employ({this.code, this.message, this.count, this.data});

 factory Employ.fromJson(Map<String, dynamic> json) {
    var accJson=json["data"]as List;
    List<Data>accList=accJson.map((i)=>Data.fromJson(i)).toList();

    accList.sort((b,a){
      return a.count.compareTo(b.count);
    });
    return Employ(
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