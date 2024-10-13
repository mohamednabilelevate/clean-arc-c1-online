import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_c1_online/di/di.dart';
import 'package:online_exam_c1_online/presentation/login/LoginViewModel.dart';
import 'package:online_exam_c1_online/presentation/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Field injection
  LoginViewModel viewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: BlocListener<LoginViewModel, LoginScreenState>(
          listenWhen: (previous, current) {
            if (previous is LoadingState) {
              Navigator.pop(context);
            }
            if (current is LoadingState || current is ErrorState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        CircularProgressIndicator(),
                        Text("Loading...")
                      ],
                    ),
                  );
                },
              );
            }
            if (state is ErrorState) {
              var message = extractErrorMessage(state.exception);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(message),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is SuccessState) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [Text("Logged in Successfully")],
                    ),
                  );
                },
              );
            }
          },
          child: Column(
            children: [
              TextFormField(),
              TextFormField(),
              BlocBuilder<LoginViewModel, LoginScreenState>(
                builder: (context, state) {
                  switch (state) {
                    case LoadingState():
                      {
                        return CircularProgressIndicator();
                      }
                    default:
                      {
                        return ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            child: Text("login"));
                      }

                    // case InitialState():
                    // case ErrorState():
                    // case SuccessState():
                  }
                },
                buildWhen: (previous, current) {
                  // don't return true unless you want to change rebuild
                  return true;
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    viewModel.add(LoginEvent("nabil@elevate.com", "123456"));
    viewModel.add(AddProductToCartEvent(10));
  }
}
