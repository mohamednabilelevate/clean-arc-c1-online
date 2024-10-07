import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';

abstract class AuthOfflineDatasource{
  Future<Result<User?>> login(String email,String password);
}