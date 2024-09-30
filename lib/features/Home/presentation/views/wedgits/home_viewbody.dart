import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/bottom_design.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_appbar.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_workoutview.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/top_design.dart';
import 'package:flutter/material.dart';

class HomeViewbody extends StatefulWidget {
  const HomeViewbody({super.key});

  @override
  State<HomeViewbody> createState() => _HomeViewbodyState();
}

class _HomeViewbodyState extends State<HomeViewbody> {
  @override
  Widget build(BuildContext context) {
        var sizee = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:Colorsapp.secondarycolor,
        body: const SingleChildScrollView(
      child: Column(
        children: [
        TopDesign(),
         CustomWorkoutview()
        ],
      ),
    ));
  }
}
