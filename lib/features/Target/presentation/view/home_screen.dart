import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Target/presentation/view/widgets/custom_target_card.dart';
import 'package:final_project/features/lose_weight/views/lose_weight_screen.dart';
import 'package:flutter/material.dart';

import '../../../Home/presentation/views/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      //Colors.grey[800],
      Colorsapp.darkGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Home", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),),
                Icon(Icons.person, color: Colors.white, size: 30,),
              ],
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height/7,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       CustomWorkoutCard(title: "Workout", image: "assets/images/exer.png"),
          //       CustomWorkoutCard(title: "Lose weight", image: "assets/images/loss_weight.png"),
          //       CustomWorkoutCard(title: "Stretch", image: "assets/images/stretch.png"),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height/1.2,
            child: GridView.count(
               crossAxisCount: 2,
              childAspectRatio: 2.5 /3,
              children: [
                CustomTargetCard(title: "Workout", image: "assets/images/exer.png", route: HomeView(), context: context,),
                CustomTargetCard(title: "Lose weight", image: "assets/images/loss_weight.png", route: LoseWeightScreen(), context: context,),
                //CustomTargetCard(title: "Stretch", image: "assets/images/stretch.png", route: HomeView(), context: context,),
                CustomTargetCard(title: "Steps", image: "assets/images/walk.png", route: HomeView(), context: context,),
                CustomTargetCard(title: "Water", image: "assets/images/water.png", route: HomeView(), context: context,),
                CustomTargetCard(title: "Sleep", image: "assets/images/sleep.png", route: HomeView(), context: context,),
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
