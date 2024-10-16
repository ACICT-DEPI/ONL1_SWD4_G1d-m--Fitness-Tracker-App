import 'package:final_project/features/body_calc/views/bf_input_screen.dart';
import 'package:final_project/features/body_calc/views/bmi_input_screen.dart';
import 'package:final_project/features/body_calc/views/bmr_input_screen.dart';
import 'package:final_project/features/body_calc/views/iw_input_screen.dart';
import 'package:flutter/material.dart';

class Calc {
  late Widget route;
  late String title;
  late String image;
}

List<Calc> calc = [
  Calc()..title = "Body Fat"..route = BfInputScreen()..image = "assets/images/BF.png",
  Calc()..title = "Body Mass Index"..route = BmiInputScreen()..image = "assets/images/BMI.png",
  Calc()..title = "Ideal Body Weight"..route = IwInputScreen()..image = "assets/images/IBW.png",
  Calc()..title = "Basal Metabolic Rate"..route = BMRInputScreen()..image = "assets/images/BMR.png",
];