import 'package:dio/dio.dart';

class ApiClient {
  Dio dio;
  
  ApiClient(this.dio);

  final String _basePath = 'https://api.themoviedb.org/3/movie';
  final String _apiKey = 'api_key=f762b12aa5ec3b09e39664a9a0915134';

  Future<Response> get(String id, {String path = ''}) async {
    final finalPath = path == ''
        ? '$_basePath/$id?$_apiKey'
        : '$_basePath/$id/$path?$_apiKey';

    final response = await dio.get(finalPath);
    return response;
  }

  // POST PUT DELE should be here
}
