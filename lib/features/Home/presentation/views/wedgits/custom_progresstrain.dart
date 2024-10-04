import 'dart:async';
import 'dart:math';

import 'package:final_project/features/Home/presentation/views/wedgits/choose_training.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:video_player/video_player.dart';

class CustomProgresstrain extends StatefulWidget {
  final String pic;
  const CustomProgresstrain({super.key, required this.pic});

  @override
  _CustomProgresstrainState createState() => _CustomProgresstrainState();
}

class _CustomProgresstrainState extends State<CustomProgresstrain> {
  bool isRun = false;
  Duration duration = const Duration(seconds: 60);
  Duration reverseDuration = const Duration(seconds: 0);
  Timer? repeated;
  bool isrestart = false;
  int completed = 0;
  startcount() {
    isRun = true;
    repeated = Timer.periodic(const Duration(seconds: 1), (timer) {
      int newsec = duration.inSeconds - 1;
      int revsec = reverseDuration.inSeconds + 1;
      setState(() {
        if (newsec <= 0) {
          timer.cancel();
          isrestart = true;
        }
        if (revsec >= 60) {
          timer.cancel();
          isrestart = true;
        }
        duration = Duration(seconds: newsec);
        reverseDuration = Duration(seconds: revsec);
        if (newsec >= 0 && newsec <= 10) {
          completed = 100;
        } else if (newsec >= 10 && newsec <= 20) {
          completed =83 ;
        } else if (newsec >= 20 && newsec <= 30) {
          completed =66 ;
        } else if (newsec >= 30 && newsec <= 40) {
          completed = 50;
        } else if (newsec >= 40 && newsec <= 50) {
          completed =33 ;
        } else if (newsec >= 50 && newsec <= 60) {
          completed =16 ;
        }
      });
    });
  }

  void resetTimer() {
    if (repeated != null) {
      repeated!.cancel();
    }
    setState(() {
      duration = const Duration(seconds: 60);
      reverseDuration = const Duration(seconds: 0);
    });
    startcount();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startcount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.fitness_center, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();

              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //               ChooseTraining(pic: widget.pic,)));
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AspectRatio(
              aspectRatio: 1.8 / 1.8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.pic), fit: BoxFit.fill),
                ),
              )),

          // Timer and progress section
          isRun
              ? Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Timer display
                        Text(
                          "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Progress indicators (total time, completed percentage)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${reverseDuration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${reverseDuration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const Text(
                                    "TOTAL TIME",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              LinearPercentIndicator(
                                // animation: true,
                                width: MediaQuery.of(context).size.width / 1.9,
                                lineHeight: 4.0,
                                percent: duration.inSeconds / 60,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                              ),
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$completed%",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    "COMPLETED",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Pause/Play button and navigation
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  if (isrestart) {
                                    resetTimer();
                                    isrestart = false;
                                  } else if (repeated!.isActive) {
                                    setState(() {
                                      repeated!.cancel();
                                    });
                                  } else {
                                    startcount();
                                  }
                                },
                                backgroundColor: Colors.cyan,
                                child: Icon(
                                  isrestart
                                      ? Icons.restart_alt
                                      : (repeated!.isActive
                                          ? Icons.pause
                                          : Icons.play_arrow),
                                  color: Colors.white,
                                ),
                              ),
                              !isrestart
                                  ? const SizedBox(
                                      width: 30,
                                    )
                                  : Container(),
                              !isrestart
                                  ? FloatingActionButton(
                                      onPressed: () {
                                        resetTimer();
                                      },
                                      backgroundColor: Colors.cyan,
                                      child: const Icon(
                                        Icons.restart_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          // : ElevatedButton(
          //     onPressed: () {
          //       startcount();
          //       isRun = true;
          //     },
          //     style: ButtonStyle(
          //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(11)))),
          //     child: const Text(
          //       "Start",
          //       style: TextStyle(fontSize: 27),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
