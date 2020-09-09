class Time {
  int code;
  String message;
  String time;
  String year;
  String month;
  String date;

  Time({this.code, this.message, this.time, this.year, this.month, this.date});

  Time.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    time = json['time'];
    year = json['year'];
    month = json['month'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['time'] = this.time;
    data['year'] = this.year;
    data['month'] = this.month;
    data['date'] = this.date;
    return data;
  }
}