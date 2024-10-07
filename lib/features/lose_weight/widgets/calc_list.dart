import 'package:final_project/features/lose_weight/views/bf_input_screen.dart';
import 'package:final_project/features/lose_weight/views/bmi_input_screen.dart';
import 'package:final_project/features/lose_weight/views/bmr_input_screen.dart';
import 'package:final_project/features/lose_weight/views/iw_input_screen.dart';
import 'package:flutter/material.dart';

class Calc {
  late Widget route;
  late String title;
}

List<Calc> calc = [
  Calc()..title = "BMI"..route = BmiInputScreen(),
  Calc()..title = "BFP"..route = BfInputScreen(),
  Calc()..title = "IBW"..route = IwInputScreen(),
  Calc()..title = "BMR"..route = BMRInputScreen(),
];