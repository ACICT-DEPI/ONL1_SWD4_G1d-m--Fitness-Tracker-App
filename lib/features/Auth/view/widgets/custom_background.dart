import 'package:final_project/core/utls/colors.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colorsapp.primarycolor, Colorsapp.secondarycolor],
          //colors: _toggle ? [primarycolor, secondarycolor] : [secondarycolor, primarycolor],
        ),
      ),
    );
  }
}
