/// code : 0
/// message : "查询成功"
/// data : [{"id":2,"sno":"1800300420","sname":"卢海佳","academyId":3,"educationBackground":0,"majorId":8,"status":0,"employmentOrientation":"考研","intentionalityCity1":"深圳","intentionalityCity2":"","intentionalityCity3":"","intentionalityJob1":6,"intentionalityJob2":1,"intentionalityJob3":1,"phone":"1244154","qq":"1541561","skill":"前端开发技术","location":"广东省深圳市","company":"华为技术有限公司","salary":8000,"failedCourses":"无","createdAt":"2020-08-22T05:51:47.000Z","updatedAt":"2020-08-22T05:51:47.000Z"}]

class Intentjson {
  int _code;
  String _message;
  List<Data> _data;

  int get code => _code;
  String get message => _message;
  List<Data> get data => _data;

  Intentjson({
      int code, 
      String message, 
      List<Data> data}){
    _code = code;
    _message = message;
    _data = data;
}

  Intentjson.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// sno : "1800300420"
/// sname : "卢海佳"
/// academyId : 3
/// educationBackground : 0
/// majorId : 8
/// status : 0
/// employmentOrientation : "考研"
/// intentionalityCity1 : "深圳"
/// intentionalityCity2 : ""
/// intentionalityCity3 : ""
/// intentionalityJob1 : 6
/// intentionalityJob2 : 1
/// intentionalityJob3 : 1
/// phone : "1244154"
/// qq : "1541561"
/// skill : "前端开发技术"
/// location : "广东省深圳市"
/// company : "华为技术有限公司"
/// salary : 8000
/// failedCourses : "无"
/// createdAt : "2020-08-22T05:51:47.000Z"
/// updatedAt : "2020-08-22T05:51:47.000Z"

class Data {
  int _id;
  String _sno;
  String _sname;
  int _academyId;
  int _educationBackground;
  int _majorId;
  int _status;
  String _employmentOrientation;
  String _intentionalityCity1;
  String _intentionalityCity2;
  String _intentionalityCity3;
  int _intentionalityJob1;
  int _intentionalityJob2;
  int _intentionalityJob3;
  String _phone;
  String _qq;
  String _skill;
  String _location;
  String _company;
  int _salary;
  String _failedCourses;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get sno => _sno;
  String get sname => _sname;
  int get academyId => _academyId;
  int get educationBackground => _educationBackground;
  int get majorId => _majorId;
  int get status => _status;
  String get employmentOrientation => _employmentOrientation;
  String get intentionalityCity1 => _intentionalityCity1;
  String get intentionalityCity2 => _intentionalityCity2;
  String get intentionalityCity3 => _intentionalityCity3;
  int get intentionalityJob1 => _intentionalityJob1;
  int get intentionalityJob2 => _intentionalityJob2;
  int get intentionalityJob3 => _intentionalityJob3;
  String get phone => _phone;
  String get qq => _qq;
  String get skill => _skill;
  String get location => _location;
  String get company => _company;
  int get salary => _salary;
  String get failedCourses => _failedCourses;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Data({
      int id, 
      String sno, 
      String sname, 
      int academyId, 
      int educationBackground, 
      int majorId, 
      int status, 
      String employmentOrientation, 
      String intentionalityCity1, 
      String intentionalityCity2, 
      String intentionalityCity3, 
      int intentionalityJob1, 
      int intentionalityJob2, 
      int intentionalityJob3, 
      String phone, 
      String qq, 
      String skill, 
      String location, 
      String company, 
      int salary, 
      String failedCourses, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _sno = sno;
    _sname = sname;
    _academyId = academyId;
    _educationBackground = educationBackground;
    _majorId = majorId;
    _status = status;
    _employmentOrientation = employmentOrientation;
    _intentionalityCity1 = intentionalityCity1;
    _intentionalityCity2 = intentionalityCity2;
    _intentionalityCity3 = intentionalityCity3;
    _intentionalityJob1 = intentionalityJob1;
    _intentionalityJob2 = intentionalityJob2;
    _intentionalityJob3 = intentionalityJob3;
    _phone = phone;
    _qq = qq;
    _skill = skill;
    _location = location;
    _company = company;
    _salary = salary;
    _failedCourses = failedCourses;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _sno = json["sno"];
    _sname = json["sname"];
    _academyId = json["academyId"];
    _educationBackground = json["educationBackground"];
    _majorId = json["majorId"];
    _status = json["status"];
    _employmentOrientation = json["employmentOrientation"];
    _intentionalityCity1 = json["intentionalityCity1"];
    _intentionalityCity2 = json["intentionalityCity2"];
    _intentionalityCity3 = json["intentionalityCity3"];
    _intentionalityJob1 = json["intentionalityJob1"];
    _intentionalityJob2 = json["intentionalityJob2"];
    _intentionalityJob3 = json["intentionalityJob3"];
    _phone = json["phone"];
    _qq = json["qq"];
    _skill = json["skill"];
    _location = json["location"];
    _company = json["company"];
    _salary = json["salary"];
    _failedCourses = json["failedCourses"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["sno"] = _sno;
    map["sname"] = _sname;
    map["academyId"] = _academyId;
    map["educationBackground"] = _educationBackground;
    map["majorId"] = _majorId;
    map["status"] = _status;
    map["employmentOrientation"] = _employmentOrientation;
    map["intentionalityCity1"] = _intentionalityCity1;
    map["intentionalityCity2"] = _intentionalityCity2;
    map["intentionalityCity3"] = _intentionalityCity3;
    map["intentionalityJob1"] = _intentionalityJob1;
    map["intentionalityJob2"] = _intentionalityJob2;
    map["intentionalityJob3"] = _intentionalityJob3;
    map["phone"] = _phone;
    map["qq"] = _qq;
    map["skill"] = _skill;
    map["location"] = _location;
    map["company"] = _company;
    map["salary"] = _salary;
    map["failedCourses"] = _failedCourses;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}