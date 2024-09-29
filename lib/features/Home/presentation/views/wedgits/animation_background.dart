import 'dart:async';

import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_workoutview.dart';
import 'package:flutter/material.dart';

class AnimationBackground extends StatefulWidget {
  const AnimationBackground({super.key});

  @override
  State<AnimationBackground> createState() => _AnimationBackgroundState();
}

class _AnimationBackgroundState extends State<AnimationBackground> {
  final Color primarycolor = Colorsapp.primarycolor;
  final Color secondarycolor = Colorsapp.secondarycolor;
  bool _toggle = true;

  @override
  void initState() {
    super.initState();
    _startColorTransition();
  }

  void _startColorTransition() {
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        _toggle = !_toggle;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _toggle ? [primarycolor, secondarycolor] : [secondarycolor, primarycolor],
        ),
      ),
      child: const CustomWorkoutview()
    );
  }
}
