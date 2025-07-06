import 'dart:io';

void main() {
  const baseDir = 'lib/core/api';
  Directory(baseDir).createSync(recursive: true);

  // api_constant.dart
  File('$baseDir/api_constant.dart').writeAsStringSync('''
class ApiConstant {
  static String baseUrl = 'https://test.online/';
}
''');

  // api_endpoint.dart
  File('$baseDir/api_endpoint.dart').writeAsStringSync('''
class ApiEndPoint {
  static String viewExam = 'api/test/exams';
 
}
''');

  // api_manager.dart
  File('$baseDir/api_manager.dart').writeAsStringSync('''
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kfs_app/core/api/api_constant.dart';

class ApiManager {
  final dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.get(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status) => true,
        headers: headers,
      ),
      data: data,
    );
    return response;
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.post(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status) => true,
        headers: headers,
      ),
      data: data,
    );
    return response;
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.delete(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status) => true,
        headers: headers,
      ),
      data: data,
    );
    return response;
  }

  Future<Response> updateData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.put(
      ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (status) => true,
        headers: headers,
      ),
      data: data,
    );
    return response;
  }
}
''');

  print('✅ Folder created lib/core/api All files successfully');
}
