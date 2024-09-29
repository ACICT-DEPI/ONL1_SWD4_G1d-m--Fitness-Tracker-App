import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key,
    required this.keyboardType,
    required this.controller,
    required this.decoration,
    required this.validator,
    this.obscure = false,
  });
  var controller;
  TextInputType keyboardType;
  InputDecoration decoration;
  String? Function(dynamic value) validator;
  bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: decoration,
      validator: validator,
      obscureText: obscure,
    );
  }
}
