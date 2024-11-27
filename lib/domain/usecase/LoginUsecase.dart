import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/repository/AuthRepository.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Result<User?>> invoke(String email,password){
    return authRepository.login(email, password);
  }
}

// 1- Single Responsibility
// 2- DI

// 1- future changes
// 2- less bugy code
// 3- easy to Test
// 4- fast

// TDD
// write test cases for each function
