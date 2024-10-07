import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/di/di.dart';
import 'package:online_exam_c1_online/domain/repository/AuthRepository.dart';

void main() {
  configureDependencies();
  runApp(MaterialApp());

}