import 'dart:ui';

import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_training_pic.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_workoutview.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/loading_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseTraining extends StatefulWidget {
  const ChooseTraining({super.key});

  @override
  State<ChooseTraining> createState() => _ChooseTrainingState();
}

List<Widget> widgetPages = [
  // HomeView(),
  // TimerView(), // Assuming you have a TimerView widget
  // CaloriesView(), // Assuming you have a CaloriesView widget
  // ProfileView(), // Assuming you have a ProfileView widget
];

class _ChooseTrainingState extends State<ChooseTraining> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colorsapp.secondarycolor,
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizee.width / 45, vertical: sizee.height / 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const CustomTrainingPic(),
            const SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  height: 160,
                  width: sizee.width / 2.1,
                  // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              // decoration: const BoxDecoration(
                              //     color: Colors.orange, shape: BoxShape.circle),
                              child: const Text(
                            "Calories",
                            style: TextStyle(fontSize: 17),
                          )),
                          const Icon(Icons.local_fire_department)
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                          width: 150,
                          child: Text(
                            "156",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Kcal",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  height: 160,
                  width: sizee.width / 2.1,
                  // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TrainingTime",
                            style: TextStyle(fontSize: 17),
                          ),
                          Icon(Icons.timer)
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          width: 150,
                          child: Text(
                            "40",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: double.infinity,
                          child: Text(
                            "min",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   height: 70,
            //   width: 70,
            //   decoration: const BoxDecoration(
            //     color: Colors.amberAccent,
            //     shape: BoxShape.circle
            //   ),
            //   child: TextButton(onPressed: () {}, child: const Text("data"))),
            // ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //         backgroundColor:
            //             WidgetStatePropertyAll(Colorsapp.darkOrange),
            //         padding: const WidgetStatePropertyAll(
            //             EdgeInsets.symmetric(vertical: 20, horizontal: 50))),
            //     child: const Text("Start"))
          ],
        ),
      ),

      floatingActionButton: Container(
        width: 85,
        height: 85,
        margin: const EdgeInsets.only(top: 45),
        child: FloatingActionButton(
          backgroundColor: Colorsapp.darkOrange,
          autofocus: true,
          isExtended: true,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const LoadingBar()));
          },
          child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Text(
                "Start",
                style: TextStyle(color: Colorsapp.secondarycolor, fontSize: 20),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22), topRight: Radius.circular(22)),
        child: BottomAppBar(
          child: SizedBox(
            height: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    _onItemTapped(0);
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const CustomWorkoutview() ));
                  },
                  child: Icon(
                    Icons.home,
                    color: _selectedIndex == 0
                        ? Colorsapp.darkOrange
                        : Colorsapp.secondarycolor,
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    _onItemTapped(3);
                  },
                  child: Icon(
                    Icons.person,
                    color: _selectedIndex == 3
                        ? Colorsapp.darkOrange
                        : Colorsapp.secondarycolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
