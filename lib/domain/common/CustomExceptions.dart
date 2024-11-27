import 'package:dio/dio.dart';
import 'package:online_exam_c1_online/data/api/model/response/ServerErrorResponse.dart';

class ServerError implements Exception{
  ServerErrorResponse? response;
  String? serverMessage;
  int? statusCode;
  ServerError({this.serverMessage, this.statusCode, this.response});
}
class DioHttpException implements Exception{
  DioException? exception;
  DioHttpException(this.exception);
}
class NoInternetError implements Exception{

}