import 'package:final_project/features/Auth/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/cubit/auth_states.dart';
import 'package:final_project/features/Auth/view/login_screen.dart';
import 'package:final_project/features/Steps/view/step_screen.dart';
import 'package:final_project/features/profile/wedgits/custom_Auth_button.dart';
import 'package:final_project/features/profile/wedgits/progress_item.dart';
import 'package:final_project/features/sleep/view/sleep_screen.dart';
import 'package:final_project/features/water/view/water_screen.dart';
import 'package:final_project/features/workout/views/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../workout/widgets/favorite_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        cubit.initProfile();
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesScreen(),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        //Color(0xff518d74),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Continue Your Workout', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      //color: Colors.grey[300],
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                  child: Image(image: AssetImage("assets/images/workout.jpeg"), width: 90,)),
                              const Text(
                                "Favorites Excercises",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              const Icon(Icons.play_circle_outline, size: 30,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ProgressItem(
                  title: "Drink Water",
                  subTitle: 'You drunk ${cubit.water} gl today 💧',
                  percent: ((cubit.water / 8) * 100).toInt(),
                  route: WaterScreen(),
                ),
                ProgressItem(
                  title: "Steps Taken",
                  subTitle: 'Yoy took ${cubit.steps} steps today 👣',
                  percent: ((cubit.steps / 8000) * 100).toInt(),
                  route: StepsScreen(),
                ),
                ProgressItem(
                  title: "Sleep Quality",
                  subTitle: 'you slept ${cubit.sleepHours} hours today 💤',
                  percent: cubit.sleepQuality,
                  route: SleepScreen(),
                ),
                ProgressItem(
                  title: "Calories Burned",
                  subTitle: 'you burned ${cubit.stepsCalories+ cubit.workoutCalories} hours today 🔥',
                  percent: (cubit.stepsCalories+ cubit.workoutCalories).toInt(),
                  route: WorkoutScreen(),
                ),
                LogOutButton(text: "Log out",
                    onPressed: () {
                  cubit.signOut().then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  });
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
