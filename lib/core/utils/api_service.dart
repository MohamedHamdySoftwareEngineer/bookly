// ignore_for_file: public_member_api_docs, sort_constructors_first
// class that handle any api services
import 'package:dio/dio.dart';

class ApiService {
  // fixed part of url, i will use in any place
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  final Dio _dio;

  ApiService({
    required Dio dio,
  }) : _dio = dio;

  // Map<String, dynamic> → The result will be a map where: The keys are of type String - The values can be of any type (dynamic).
  // Url = baseUrl + endPoint
  // async,await to can recieve data
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // here the request
    var response = await _dio.get('$_baseUrl$endPoint');

    return response.data;
  }
}
