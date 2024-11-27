import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/repository/AuthRepository.dart';
import 'package:online_exam_c1_online/domain/usecase/LoginUsecase.dart';

import 'LoginUseCase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main(){


  test("when call invoke it should call authRepo.login with correct parameters", ()async{
    var authRepo = MockAuthRepository();
    var loginUseCase = LoginUseCase(authRepo);
    var email = "fakeEmail";
    var password = "password";

    var mockedResult = Success<User?>(User());
    provideDummy<Result<User?>>(mockedResult);
    when(authRepo.login(email, password)).thenAnswer((_) async=>
      mockedResult,);

    var result = await loginUseCase.invoke(email,password);
    expect(result, mockedResult);
    verify(authRepo.login(email, password)).called(1);

  });
}