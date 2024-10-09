import 'package:final_project/features/Auth/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/cubit/auth_states.dart';
import 'package:final_project/features/Auth/view/login_screen.dart';
import 'package:final_project/features/lose_weight/views/lose_weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../../Steps/view/step_counter_screen.dart';
import '../../Workout/presentation/views/workout_screen.dart';
import '../widgets/custom_target_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        //Colorsapp.darkGrey,
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 15.0, left: 15, top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                          color: Colorsapp.darkOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                      ),
                      Text(
                        "hello, ${AuthCubit.get(context).name??""}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        AuthCubit.get(context).signOut().then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        });
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colorsapp.liteGrey,
                        size: 30,
                      )),
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
              height: MediaQuery.of(context).size.height / 1.2,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.5 / 3,
                children: [
                  CustomTargetCard(
                    title: "Workout",
                    image: "assets/images/exer.png",
                    route: WorkoutScreen(),
                    context: context,
                  ),
                  CustomTargetCard(
                    title: "Lose weight",
                    image: "assets/images/loss_weight.png",
                    route: LoseWeightScreen(),
                    context: context,
                  ),
                  CustomTargetCard(
                    title: "Steps",
                    image: "assets/images/walk.png",
                    route: StepCounterScreen(),
                    context: context,
                  ),
                  CustomTargetCard(
                    title: "Water",
                    image: "assets/images/water.png",
                    route: WorkoutScreen(),
                    context: context,
                  ),
                  CustomTargetCard(
                    title: "Sleep",
                    image: "assets/images/sleep.png",
                    route: WorkoutScreen(),
                    context: context,
                  ),
                  // CustomTargetCard(),
                  // CustomTargetCard(),
                  // CustomTargetCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
