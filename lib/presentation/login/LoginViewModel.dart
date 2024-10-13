import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/usecase/LoginUsecase.dart';

@injectable
class LoginViewModel extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginUseCase loginCase;
  //                        start state
  LoginViewModel(this.loginCase) : super(InitialState()) {
    on<LoginScreenEvent>(
      (event, emit) async {
        await doEvent(event, emit);
      },
    );
  }

  Future<void> doEvent(
      LoginScreenEvent event, Emitter<LoginScreenState> emit) async {
    switch (event) {
      case LoginEvent():
        await _login(event, emit);
      case AddProductToCartEvent():
        _addProductToCart(event);
    }
  }

  Future<void> _login(LoginEvent event, Emitter<LoginScreenState> emit) async {
    emit(LoadingState());

    var result = await loginCase.invoke(event.email, event.password);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ErrorState(result.exception));
        }
    }
  }

  void _addProductToCart(AddProductToCartEvent event) {
    //
  }
  void _addProductToWishList() {}
}

sealed class LoginScreenEvent {}

class LoginEvent extends LoginScreenEvent {
  String email;
  String password;
  LoginEvent(this.email, this.password);
}

class AddProductToCartEvent extends LoginScreenEvent {
  int productId;
  AddProductToCartEvent(this.productId);
}

sealed class LoginScreenState {}

class InitialState extends LoginScreenState {}

class LoadingState extends LoginScreenState {}

class ErrorState extends LoginScreenState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends LoginScreenState {
  User? user;
  SuccessState(this.user);
}

//linting
