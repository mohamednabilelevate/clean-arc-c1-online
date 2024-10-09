import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/usecase/LoginUsecase.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState>{
  LoginUseCase loginCase;
  //                        start state
  LoginViewModel(this.loginCase):super(InitialState());

  void doIntent(LoginScreenIntent intent){
    switch (intent) {

      case LoginIntent():_login(intent);
      case AddProductToCartInent():_addProductToCart(intent);
    }
  }
  void _login(LoginIntent intent) async{
    emit(LoadingState());

    var result = await loginCase.invoke(intent.email,
        intent.password);
    switch (result) {

      case Success<User?>():{
        emit(SuccessState(result.data));
      }
      case Fail<User?>():{
        emit(ErrorState(result.exception));
      }
    }
  }
  void _loadCategories(){}
  void _loadOffers(){}
  void _occasions(){}
  void _addProductToCart(AddProductToCartInent intent ){
    //
  }
  void _addProductToWishList(){

  }

}
sealed class LoginScreenIntent{}
class LoginIntent extends LoginScreenIntent{
  String email;
  String password;
  LoginIntent(this.email,this.password);
}
class AddProductToCartInent extends LoginScreenIntent{
  int productId;
  AddProductToCartInent(this.productId);
}

sealed class LoginScreenState{}
class InitialState extends LoginScreenState{}
class LoadingState extends LoginScreenState{}
class ErrorState extends LoginScreenState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends LoginScreenState{
  User? user;
  SuccessState(this.user);
}