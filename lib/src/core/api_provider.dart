import 'package:dio/dio.dart';

class ApiProvider {
  late Dio dio;

  ApiProvider() {
    dio = Dio(BaseOptions(
        validateStatus: (status) {
          return true;
        },
        followRedirects: false,
        baseUrl: 'https://api.themoviedb.org/3/',
        connectTimeout: 30000));
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response.data;
    } on DioError catch (err) {
      throw ('The error is $err');
    }
  }
}
