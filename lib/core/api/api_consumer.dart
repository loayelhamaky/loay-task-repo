import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(String path);
  Future<dynamic> post(String path, {dynamic data});
}

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio);

  @override
  Future get(String path) async {
    try {
      print('Making GET request to $path');
      final response = await dio.get(path);
      print('GET request successful: ${response.data}');
      return response.data;
    }
    catch(e){
     throw(e.toString());
    }
  }

  @override
  Future post(String path, {data}) async {
    print('Making POST request to $path');
    final response = await dio.post(path, data: data);
    print('POST request successful: ${response.data}');
    return response.data;
  }
}
