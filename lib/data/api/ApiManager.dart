import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/api/ApiConstants.dart';
import 'package:online_exam_c1_online/data/api/model/UserDto.dart';
import 'package:online_exam_c1_online/data/api/model/request/RegisterRequest.dart';
import 'package:online_exam_c1_online/data/api/model/response/AuthResponse.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/common/CustomExceptions.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';

@lazySingleton
class ApiManager{
  late Dio _dio;

  ApiManager(){
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl
    ));
  }
  // static ApiManager? _apiManager;
  //
  // static ApiManager getInstance(){
  //   if(_apiManager == null){
  //     _apiManager = ApiManager._();
  //   }
  //   return _apiManager!;
  // }


  Future<AuthResponse?> login(String email,String password)async{
      var response = await _dio.post(ApiConstants.signInApi,data: {
        "email":email,
        "password":password
      });
      var authResponse = AuthResponse.fromJson(response.data);
      return authResponse;
  }

  Future<AuthResponse?> register(RegisterRequest requestBody)async{
   var response = await _dio.post(ApiConstants.registerApi,data:
   requestBody);
   var authResponse = AuthResponse.fromJson(response.data);
   return authResponse;

  }
}