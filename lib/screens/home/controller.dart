import 'package:dio/dio.dart';

class AyaController {
  Dio dio = Dio();

  Future<Response> getData() async {
    dio.options.baseUrl = 'https://www.ayahospital.com.sa/wp-json/menus/v1';
    Response response;

    try {
      response = await dio.get('/menus/main-meny');
    } on DioError catch (e) {
      if (DioErrorType.DEFAULT == e.type) {
        if (e.message.contains('SocketException')) {
          return response;
        }
      }
    }
    return response;
  }

  Future<Response> getDoctors() async {
    dio.options.baseUrl = 'https://www.ayahospital.com.sa/wp-json/wp/v2';
    Response response;

    try {
      response = await dio.get('/posts');
    } on DioError catch (e) {
      if (DioErrorType.DEFAULT == e.type) {
        if (e.message.contains('SocketException')) {
          return response;
        }
      }
    }
    return response;
  }

  Future<Response> getPage({String pageId}) async {
    dio.options.baseUrl = 'https://www.ayahospital.com.sa/wp-json/wp/v2';
    Response response;

    try {
      response = await dio.get('/pages/$pageId');
    } on DioError catch (e) {
      if (DioErrorType.DEFAULT == e.type) {
        if (e.message.contains('SocketException')) {
          return response;
        }
      }
    }
    return response;
  }
}
