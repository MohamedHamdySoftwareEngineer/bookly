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
        // TODO: Handle this case.
        break;
      case DioErrorType.cancel:
        // TODO: Handle this case.
        break;
      case DioErrorType.other:
        // TODO: Handle this case.
        break;
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found!,Please try later.');
    }
    else if (statusCode == 500) {
      return ServerFailure('Internal Server Error!,Please try later.');
  }
}
