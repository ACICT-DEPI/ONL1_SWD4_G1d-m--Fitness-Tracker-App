import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_appbar.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/fitness_list.dart';
import 'package:flutter/material.dart';

class CustomWorkoutview extends StatelessWidget {
  const CustomWorkoutview({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(sizee.width / 33),
        child: const FitnessList(),
      ),
    );
  }
}
