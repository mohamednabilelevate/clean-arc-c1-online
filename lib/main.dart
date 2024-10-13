import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/di/di.dart';
import 'package:online_exam_c1_online/presentation/login/LoginScreen.dart';

void main() {

  configureDependencies();
  runApp(MaterialApp(
    home: LoginScreen(),
  ));

}