import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/usecase/LoginUsecase.dart';
import 'package:online_exam_c1_online/presentation/login/LoginViewModel.dart';

import 'LoginViewModel_test.mocks.dart';

@GenerateMocks([LoginUseCase])
void main() {


  late LoginViewModel loginViewModel;
  late LoginUseCase loginUseCase;
  setUp((){
     loginUseCase = MockLoginUseCase();
     loginViewModel = LoginViewModel(loginUseCase);
  });


  blocTest<LoginViewModel,LoginScreenState>(
    'when call doIntent with loginIntent it should call '
        'login from useCase and change state with the right sequence',
    build: () {
      var result = Success(User());

      provideDummy<Result<User?>>(result);
      when(loginUseCase.invoke("email", "password")).thenAnswer((_)async => result);
      return loginViewModel;
    },
    act: (viewModel) { viewModel.doIntent(LoginIntent("email", "password")); },
    expect: (){
     verify(loginUseCase.invoke("email", "password")).called(1);
      return [
      isA<LoadingState>(),
      isA<SuccessState>(),
      ];
    },
  );

  blocTest<LoginViewModel,LoginScreenState>(
    'when call doIntent with login and login use case returns fail it should emit ErrorState',
    build: () {
      var result = Fail<User?>(Exception());

      provideDummy<Result<User?>>(result);
      when(loginUseCase.invoke("email", "password")).thenAnswer((_)async => result);
      return loginViewModel;
    },
    act: (viewModel) { viewModel.doIntent(LoginIntent("email", "password")); },
    expect: (){
     verify(loginUseCase.invoke("email", "password")).called(1);
      return [
      isA<LoadingState>(),
      isA<ErrorState>(),
      ];
    },
  );
}