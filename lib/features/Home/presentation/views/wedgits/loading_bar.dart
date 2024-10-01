import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_progresstrain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>   CustomProgresstrain()));
      },
    );
  }

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
            const Text("100%",
                style: TextStyle(fontSize: 90, color: Colors.white)),
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
                    maxValue: 100,
                    size: 7,
                    border:
                        Border.all(width: 1, color: Colorsapp.secondarycolor),
                    borderRadius: BorderRadius.zero,
                    animatedDuration: const Duration(seconds: 5),
                    currentValue: 75,
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
