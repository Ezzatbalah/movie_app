import 'package:dio/dio.dart';

abstract class Failure {
  String errorMassege;
  Failure(this.errorMassege);
}

class ServerFailuer extends Failure {
  ServerFailuer(super.errorMassege);
  factory ServerFailuer.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer("Connection TimwOut With ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailuer("sendTimeout With ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailuer("receiveTimeout With ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailuer("badCertificate With ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailuer("Rewquest With ApiServer was canseled");
      case DioExceptionType.connectionError:
        return ServerFailuer("Connection  With ApiServer");
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketExcepton')) {
          return ServerFailuer("No inter net connection");
        }
        return ServerFailuer("UnExcepected error,try later");
    }
  }
  factory ServerFailuer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailuer(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailuer('Your request not found,Please try later!');
    } else if (statusCode == 500) {
      return ServerFailuer('internal servar letar,Please try later!');
    } else {
      return ServerFailuer("oops ther was error,Please try later!");
    }
  }
}
