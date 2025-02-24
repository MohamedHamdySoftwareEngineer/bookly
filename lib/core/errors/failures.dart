

import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection timeout with Apiserver');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with Apiserver');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Recieve timeout with Apiserver');
      case DioErrorType.response:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to Apisever was canceld');
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try later.');
      default:
        return ServerFailure('Oops! There was an error!, Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found!,Please try later.');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error!,Please try later.');
    } else {
      return ServerFailure('Oops! There was an error!, Please try Later.');
    }
  }
}
