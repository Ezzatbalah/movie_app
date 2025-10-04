import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://api.themoviedb.org/3/';
  Dio _dio;
  ApiServices(this._dio);
  Future<Map<String, dynamic>> getPopular({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Invalid response type: ${response.data.runtimeType}');
    }
  }
}
