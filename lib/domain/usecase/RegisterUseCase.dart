import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/repository/AuthRepository.dart';

@injectable
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Result<User?>> invoke(String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone){
    return authRepository.register(
      username,firstName,
      lastName,
      email,
      password,
      rePassword,
      phone
    );
  }
}