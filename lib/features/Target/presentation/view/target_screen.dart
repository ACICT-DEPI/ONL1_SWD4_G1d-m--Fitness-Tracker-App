import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Target/presentation/view/widgets/custom_target_card.dart';
import 'package:final_project/features/Target/presentation/view/widgets/custom_workout_card.dart';
import 'package:flutter/material.dart';

class TargetScreen extends StatelessWidget {
  const TargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsapp.darkGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Target", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),),
                Icon(Icons.person, color: Colors.white, size: 30,),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/7,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomWorkoutCard(title: "Workout", image: "assets/images/exer.png"),
                CustomWorkoutCard(title: "Lose weight", image: "assets/images/loss_weight.png"),
                CustomWorkoutCard(title: "Stretch", image: "assets/images/stretch.png"),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/1.5,
            child: ListView(
              children: [
                CustomTargetCard(title: "1,000 more steps per day", image: "assets/images/walk.png",),
                CustomTargetCard(title: "Drink more water per day", image: "assets/images/water.png"),
                CustomTargetCard(title: "7 hours of sleep per night", image: "assets/images/sleep.png"),
                // CustomTargetCard(),
                // CustomTargetCard(),
                // CustomTargetCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
