import 'dart:math';

import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_progresstrain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class LoadingBar extends StatefulWidget {
  final String pic;
  const LoadingBar({super.key, required this.pic});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  int currentValue = 0;
  final Random random = Random();
  @override
  void initState() {
    super.initState();
    // Simulate progress
    _simulateProgress();
  }

  void _simulateProgress() {
    Future.delayed(const Duration(seconds: 1), () {
      if (currentValue < 100) {
        setState(() {
          int increment = random.nextInt(10) + 1;
          // Ensure currentValue does not exceed 100
          currentValue = (currentValue + increment).clamp(0, 100);
        });
        _simulateProgress();
       
      }else{
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CustomProgresstrain(pic: widget.pic,)));
      }
      
    });
  }
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(
  //     const Duration(seconds: 5),
  //     () {
  //       if (currentValue < 100) {
  //       setState(() {
  //         currentValue += 10; // Increment progress
  //       });
  //        }
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => CustomProgresstrain(pic: widget.pic,)));
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var cwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colorsapp.secondarycolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: cwidth * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text("$currentValue%",
                style: const TextStyle(fontSize: 90, color: Colors.white)),
            // const SizedBox(height: 100,),
            Column(
              children: [
                const Text("Workout Loading ...",
                    style: TextStyle(fontSize: 17, color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: FAProgressBar(
                    maxValue: 80,
                    size: 7,
                    border:
                        Border.all(width: 1, color: Colorsapp.secondarycolor),
                    borderRadius: BorderRadius.zero,
                    animatedDuration: const Duration(seconds: 5),
                    currentValue: currentValue.toDouble(),
                    backgroundColor: Colorsapp.liteGrey,
                    progressColor: Colorsapp.darkOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
