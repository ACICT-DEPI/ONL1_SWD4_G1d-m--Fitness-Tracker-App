import 'package:final_project/features/sleep/cubit/sleep_cubit.dart';
import 'package:final_project/features/sleep/cubit/sleep_states.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SleepCubit, SleepStates>(
        listener: (context, state) {},
      builder: (context, state) {
        var cubit = SleepCubit.get(context);
        return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            //backgroundImage: AssetImage('assets/avatar.jpg'), // Add your own avatar image
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sleep Tracking",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SleepCard(
                  color: Colors.purple,
                  time: '22:25',
                  label: 'Went to sleep',
                  icon: Icons.bedtime,
                ),
                GestureDetector(
                  onTap: (){
                    //cubit.openAlarm();
                  },
                  child: _SleepCard(
                    color: Colors.teal,
                    time: '07:00',
                    label: 'Woke up',
                    icon: Icons.alarm,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Sleep Timing",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 1),
                        FlSpot(2, 1.5),
                        FlSpot(3, 1),
                        FlSpot(4, 2),
                        FlSpot(5, 1.8),
                      ],
                      isCurved: true,
                      color:Colors.white,
                      barWidth: 4,
                      isStrokeCapRound: true,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),))
                },
                icon: Icon(Icons.nightlight, size: 50,),),
          ],
        ),
      ),
    );
      },
    );
  }
}

class _SleepCard extends StatelessWidget {
  final Color color;
  final String time;
  final String label;
  final IconData icon;

  _SleepCard({
    required this.color,
    required this.time,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            Spacer(),
            Text(
              time,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}