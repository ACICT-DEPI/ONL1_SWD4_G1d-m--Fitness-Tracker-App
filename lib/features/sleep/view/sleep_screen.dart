import 'package:final_project/features/sleep/cubit/sleep_cubit.dart';
import 'package:final_project/features/sleep/cubit/sleep_states.dart';
import 'package:final_project/features/sleep/view/sleep_tracker_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/caching/caching_helper.dart';
import '../../../core/utils/colors.dart';
import '../widgets/sleep_card.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  @override
  void initState() {
    super.initState();
    SleepCubit.get(context).initSleep();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SleepCubit, SleepStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SleepCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Sleep Tracker',
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: ()async{
                        final TimeOfDay? pickedTime = await showTimePicker(context: context,
                          initialTime: cubit.selectedSleepTime ?? TimeOfDay.now(),
                        );
                        if (pickedTime != null && pickedTime != cubit.selectedSleepTime) {
                          setState(() {
                            print(pickedTime);
                            cubit.selectedSleepTime = pickedTime;
                            CachingHelper.instance?.writeData('savedSleepTime', pickedTime.toString());
                            print(CachingHelper.instance?.readString('savedSleepTime'));
                          });
                        }
                      },
                      child: SleepCard(
                        color: cubit.selectedSleepTime != null ?Colorsapp.darkOrange: Colorsapp.darkGrey,
                        time: cubit.selectedSleepTime != null ?cubit.selectedSleepTime!.format(context):"6:00 AM",
                        label: 'Went to sleep',
                        icon: Icons.bedtime,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now(),);
                        if (picked != null) {
                          setState(() {
                            cubit.selectedAlarmTime = picked;
                            CachingHelper.instance?.writeData('savedAlarmTime', picked.toString());
                            cubit.setAlarm();
                          });
                        }
                      },
                      child: SleepCard(
                        color: cubit.selectedAlarmTime != null ?Colors.teal: Colorsapp.darkGrey,
                        time: cubit.selectedAlarmTime != null ?cubit.selectedAlarmTime!.format(context):"No Alarm",
                        label: 'Woke up',
                        icon: Icons.alarm,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Sleep Timing",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: true),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(1, 1),
                            const FlSpot(2, 1.5),
                            const FlSpot(3, 1),
                            const FlSpot(4, 2),
                            const FlSpot(5, 1.8),
                          ],
                          isCurved: true,
                          color: Colors.white,
                          barWidth: 4,
                          isStrokeCapRound: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SleepTrackerScreen()));
                  },
                  icon: const Icon(
                    Icons.nightlight,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


