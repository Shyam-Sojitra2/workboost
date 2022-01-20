import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workboost/model/availability.dart';
import 'package:workboost/screens/add_assignment.dart';
import 'package:workboost/screens/add_availability.dart';
import 'package:workboost/screens/assignment_list.dart';
import 'package:workboost/screens/availability_list.dart';
import 'package:workboost/screens/my_availability.dart';
import 'package:workboost/theme.dart';
import 'package:workboost/screens/sign_up.dart';
import 'package:workboost/theme2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "WorkBoost",
      theme: myTheme2,
      home: SignUp(
          // keyval: "4",
          ),
    );
  }
}
