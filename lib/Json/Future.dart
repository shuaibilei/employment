import 'package:dio/dio.dart';

import '../count.dart';

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