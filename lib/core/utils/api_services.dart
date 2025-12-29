import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://api.themoviedb.org/3/';

  Dio _dio;
  ApiServices(this._dio) {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OTQ5NTgwZmIwZjIxZjEwMmFjMDkyZmEzNzgyY2MzOCIsIm5iZiI6MTc1NDIzMDgyMi41MjEsInN1YiI6IjY4OGY3MDI2YWI5ZTU2MjE0NzdjZjc1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.imfU7_Wl9aUXfr49YM_F1BvAb9Hr1pRNjC9dM1n-Bn0',
      'Accept': 'application/json',
    };
  }
  Future<Map<String, dynamic>> getMovie({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Invalid response type: ${response.data.runtimeType}');
    }
  }
}
