import 'package:final_project/features/water/cubit/water_cubit.dart';
import 'package:final_project/features/water/cubit/water_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/caching/caching_helper.dart';

class WaterScreen extends StatefulWidget {
  @override
  _WaterScreenState createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  @override
  void initState() {
    super.initState();
    WaterCubit.get(context).initWater();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WaterCubit, WaterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WaterCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Water Tracker',
              style: TextStyle(color: Colors.white),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                )),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STAY HYDRATED, DRINK WATER',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Current water intake display
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Set reminder to drink water',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    cubit.selectedReminderTime != null
                                      ? cubit.selectedReminderTime!.format(context)
                                      : "No Reminder",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue),
                                  ),
                                  Text('1gl water', style: TextStyle(fontSize: 16, color: Colors.grey),),
                                  SizedBox(height: 20,),
                                  GestureDetector(
                                onTap: () async {
                                    final TimeOfDay? picked = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        cubit.selectedReminderTime = picked;
                                        CachingHelper.instance?.writeData(
                                            'savedWaterReminderTime',
                                            picked.toString());
                                        cubit.setAlarm();
                                      });
                                    }
                                  },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.height / 18,
                                  decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                  child: Center(
                                    child: Text(
                                      'Add reminder',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                                ],
                              ),
                              Spacer(),
                              Icon(FontAwesomeIcons.glassWaterDroplet, color: Colors.blue.shade200, size: 100,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Circular progress indicator for daily water goal
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: CircularProgressIndicator(
                            value: cubit.progress,
                            strokeWidth: 12,
                            //color: Colors.white,
                            backgroundColor: Colors.blue.shade100,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.water_drop,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text(
                              '${cubit.totalWater.toInt()}gl',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'of ${cubit.waterGoal.toInt()} glasses',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // Add water button
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.7,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.addWater(200); // adds 200ml
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add a glass',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.glassWater,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Daily goal status
                  Center(
                    child: Text(
                      'You got ${((cubit.totalWater / cubit.waterGoal) * 100).toInt()}% of today\'s goal. Keep it up!',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
