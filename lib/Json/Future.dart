import 'package:dio/dio.dart';
import 'package:employment/Json/Employ.dart';
import 'package:employment/future/Count.dart';
import 'City.dart';
import 'Time.dart';



Future<Count> getData() async{
  Dio dio = Dio();
  Response res = await dio.get('http://thesecondclass.linaxhua.cn/api/Intention/intention');
  print(1);
  if (res.statusCode == 200) {
    print(1);
    return Count.fromJson(res.data);
  } else {
    Future.error("请求失败");
  }
}
Future<City> getCity() async{
  Dio dio = Dio();
  Response res = await dio.get('http://thesecondclass.linaxhua.cn/api/Intention/city?grade=17&academyNum=003&major=0&mark=0&order=1');
  print(res.data.toString());
  if (res.statusCode == 200) {
    print(1);
    return City.fromJson(res.data);
  } else {
    Future.error("请求失败");
  }
}
Future<Employ> getemploy() async{
  Dio dio = Dio();
  Response res = await dio.get('http://thesecondclass.linaxhua.cn/api/Intention/job?grade=17&academyNum=003&major=0&mark=0&order=1');
  print(1);
  print(res.data.toString());
  if (res.statusCode == 200) {
    print(1);
    return Employ.fromJson(res.data);
  } else {
    Future.error("请求失败");
  }
}
Future<Time> geteTime() async{
  Dio dio = Dio();
  Response res = await dio.get('http://thesecondclass.linaxhua.cn/api/Intention/getTime');
  print(1);
  if (res.statusCode == 200) {
    print(1);
    return Time.fromJson(res.data);
  } else {
    Future.error("请求失败");
  }
}