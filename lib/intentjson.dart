class Intentjson {
  int code;
  String message;
  Data data;

  Intentjson({this.code, this.message, this.data});

  Intentjson.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int count;
  List<Rows> rows;

  Data({this.count, this.rows});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = new List<Rows>();
      json['rows'].forEach((v) {
        rows.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int id;
  String sno;
  String sname;
  int academyId;
  int educationBackground;
  int majorId;
  int status;
  String employmentOrientation;
  String intentionalityCity1;
  String intentionalityCity2;
  String intentionalityCity3;
  String intentionalityJob1;
  String intentionalityJob2;
  String intentionalityJob3;
  String phone;
  String qq;
  String skill;
  String location;
  String company;
  int salary;
  String failedCourses;
  String createdAt;
  String updatedAt;

  Rows(
      {this.id,
        this.sno,
        this.sname,
        this.academyId,
        this.educationBackground,
        this.majorId,
        this.status,
        this.employmentOrientation,
        this.intentionalityCity1,
        this.intentionalityCity2,
        this.intentionalityCity3,
        this.intentionalityJob1,
        this.intentionalityJob2,
        this.intentionalityJob3,
        this.phone,
        this.qq,
        this.skill,
        this.location,
        this.company,
        this.salary,
        this.failedCourses,
        this.createdAt,
        this.updatedAt});

  Rows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sno = json['sno'];
    sname = json['sname'];
    academyId = json['academyId'];
    educationBackground = json['educationBackground'];
    majorId = json['majorId'];
    status = json['status'];
    employmentOrientation = json['employmentOrientation'];
    intentionalityCity1 = json['intentionalityCity1'];
    intentionalityCity2 = json['intentionalityCity2'];
    intentionalityCity3 = json['intentionalityCity3'];
    intentionalityJob1 = json['intentionalityJob1'];
    intentionalityJob2 = json['intentionalityJob2'];
    intentionalityJob3 = json['intentionalityJob3'];
    phone = json['phone'];
    qq = json['qq'];
    skill = json['skill'];
    location = json['location'];
    company = json['company'];
    salary = json['salary'];
    failedCourses = json['failedCourses'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sno'] = this.sno;
    data['sname'] = this.sname;
    data['academyId'] = this.academyId;
    data['educationBackground'] = this.educationBackground;
    data['majorId'] = this.majorId;
    data['status'] = this.status;
    data['employmentOrientation'] = this.employmentOrientation;
    data['intentionalityCity1'] = this.intentionalityCity1;
    data['intentionalityCity2'] = this.intentionalityCity2;
    data['intentionalityCity3'] = this.intentionalityCity3;
    data['intentionalityJob1'] = this.intentionalityJob1;
    data['intentionalityJob2'] = this.intentionalityJob2;
    data['intentionalityJob3'] = this.intentionalityJob3;
    data['phone'] = this.phone;
    data['qq'] = this.qq;
    data['skill'] = this.skill;
    data['location'] = this.location;
    data['company'] = this.company;
    data['salary'] = this.salary;
    data['failedCourses'] = this.failedCourses;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
