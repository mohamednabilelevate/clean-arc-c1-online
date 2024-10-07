import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/contracts/auth/AuthOfflineDataSource.dart';
import 'package:online_exam_c1_online/data/contracts/auth/AuthOnlineDataSource.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/repository/AuthRepository.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository{
  AuthOnlineDatasource onlineDatasource;// DIP -> DI
  AuthOfflineDatasource offlineDatasource;

  AuthRepoImpl(this.onlineDatasource,
      this.offlineDatasource);// constructor injection

  @override
  Future<Result<User?>> login(String email, String password) {

    return onlineDatasource.login(email, password);
  }

  @override
  Future<Result<User?>> register(String username, String firstName,
      String lastName,
      String email, String password,
      String rePassword, String phone) {

    throw UnimplementedError();
  }

}