/// code : 0
/// data : [{"id":1,"number":"011","name":"机电工程学院","details":"在校门口","createdAt":"2020-08-13T02:58:04.000Z","updatedAt":"2020-08-14T03:36:52.000Z"},{"id":2,"number":"002","name":"通信工程学院","details":"","createdAt":"2020-08-14T09:43:30.000Z","updatedAt":"2020-08-14T09:43:30.000Z"},{"id":3,"number":"003","name":"计算机与信息安全学院","details":"","createdAt":"2020-08-14T09:43:50.000Z","updatedAt":"2020-08-14T09:43:50.000Z"},{"id":4,"number":"004","name":"艺术与设计学院","details":"string","createdAt":"2020-08-14T10:04:16.000Z","updatedAt":"2020-08-14T10:04:16.000Z"},{"id":5,"number":"005","name":"计算机与信息安全学院","details":"string","createdAt":"2020-08-14T10:17:31.000Z","updatedAt":"2020-08-14T10:17:31.000Z"}]
/// total : 5
/// message : "查询成功！"
//////////////////对已有接口数据的实验
class Json {
  int _code;
  List<Data> _data;
  int _total;
  String _message;

  int get code => _code;
  List<Data> get data => _data;
  int get total => _total;
  String get message => _message;

  Json({
      int code, 
      List<Data> data, 
      int total, 
      String message}){
    _code = code;
    _data = data;
    _total = total;
    _message = message;
}

  Json.fromJson(dynamic json) {
    _code = json["code"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
    _total = json["total"];
    _message = json["message"];
  }



  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["total"] = _total;
    map["message"] = _message;
    return map;
  }

}

/// id : 1
/// number : "011"
/// name : "机电工程学院"
/// details : "在校门口"
/// createdAt : "2020-08-13T02:58:04.000Z"
/// updatedAt : "2020-08-14T03:36:52.000Z"

class Data {
  int _id;
  String _number;
  String _name;
  String _details;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get number => _number;
  String get name => _name;
  String get details => _details;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Data({
      int id, 
      String number, 
      String name, 
      String details, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _number = number;
    _name = name;
    _details = details;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _number = json["number"];
    _name = json["name"];
    _details = json["details"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["number"] = _number;
    map["name"] = _name;
    map["details"] = _details;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}