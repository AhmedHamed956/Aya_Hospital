// import 'package:dio/dio.dart';

// class NetWork {
//   final String _baseUrl = 'https://www.ayahospital.com.sa/wp-json/wp/v2';
//   Dio dio = Dio();

//   Future<List<Map<String, dynamic>>> getData(
//       {String url, List<Map<String, dynamic>> headers}) async {
//     List<Map<String, dynamic>> jsonResponse;
//     dio.options.baseUrl = _baseUrl;
//     headers != null
//         ? dio.options.headers = headers[0]
//         : dio.options.headers.clear();

//     try {
//       final response = await dio.get('/$url');
//       jsonResponse = _handelResponse(response);
//     } on DioError catch (e) {
//       if (DioErrorType.DEFAULT == e.type) {
//         if (e.message.contains('SocketException')) {
//           return jsonResponse;
//         }
//       }
//     }
//     return jsonResponse;
//   }

 

 

//   List<Map<String, dynamic>> _handelResponse(List<Map<String, dynamic>> response) {
//     switch (response!=null) {
//       case 200:
//         return response;
//       case 400:
//         var jsonResponse = 'unauth';
//         return jsonResponse;
//       case 401:
//         var jsonResponse = 'unauth';
//         return jsonResponse;
//       case 403:
//         var jsonResponse = 'unauth';
//         return jsonResponse;
//       case 500:
//         var jsonResponse = 'server error';
//         return jsonResponse;

//       default:
//         var jsonResponse = 'server error';
//         return jsonResponse;
//     }
//   }
// }
