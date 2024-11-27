import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_c1_online/data/contracts/auth/AuthOfflineDataSource.dart';
import 'package:online_exam_c1_online/data/contracts/auth/AuthOnlineDataSource.dart';
import 'package:online_exam_c1_online/data/repsitory/auth/AuthRepoImpl.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';

import 'AuthRepository_test.mocks.dart';

@GenerateMocks([AuthOnlineDatasource,AuthOfflineDatasource])
void main() {
  test('when call AuthRepo login it should call login function from onlineDataSource', ()async {

    var onlineDataSource = MockAuthOnlineDatasource();
    var offlineDataSource = MockAuthOfflineDatasource();
    var authRepo = AuthRepoImpl(onlineDataSource, offlineDataSource);
    var email = "email";
    var password = "password";

    var result = Success(User());
    provideDummy<Result<User?>>(result);

    when(onlineDataSource.login(email, password))
        .thenAnswer((_) async=> result ,);


    var actual = await authRepo.login(email, password);

    verify(onlineDataSource.login(email, password)).called(1);

    expect(actual, result);

  });


 test('when call AuthRepo register it should call register function from onlineDataSource', ()async {

    var onlineDataSource = MockAuthOnlineDatasource();
    var offlineDataSource = MockAuthOfflineDatasource();
    var authRepo = AuthRepoImpl(onlineDataSource, offlineDataSource);
    var email = "email";
    var password = "password";
    var firstName = "first";
    var lastName = "last";
    var userName = "username";
    var rePassword = "repassword";
    var phone = "phone";

    var result = Success(User());
    provideDummy<Result<User?>>(result);

    when(onlineDataSource.register(userName,
   firstName,lastName,email,password,rePassword,
        phone))
        .thenAnswer((_) async=> result ,);


    var actual = await authRepo.register(userName,
        firstName,lastName,email,password,rePassword,
        phone);

    verify(onlineDataSource.register(userName,
        firstName,lastName,email,password,rePassword,
        phone)).called(0);

    expect(actual, result);

  });
}