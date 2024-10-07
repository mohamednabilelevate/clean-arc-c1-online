import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/contracts/auth/AuthOfflineDataSource.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';

@Injectable(as: AuthOfflineDatasource)
class AuthOfflineDatasourceImpl implements AuthOfflineDatasource{

  @override
  Future<Result<User?>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

}