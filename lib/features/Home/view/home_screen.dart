import 'package:final_project/features/Auth/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/cubit/auth_states.dart';
import 'package:final_project/features/Auth/view/login_screen.dart';
import 'package:final_project/features/lose_weight/views/lose_weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/colors.dart';
import '../../Steps/view/step_screen.dart';
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
              padding: const EdgeInsets.only(
                  right: 15.0, left: 15, top: 30, bottom: 10),
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
                        "hello, ${AuthCubit.get(context).name ?? ""}",
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/exer.png"),
                        fit: BoxFit.fill,
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Workout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Daily Challenge🔥",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkoutScreen(),
                                  ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 20,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange[400],
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Start",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Icon(Icons.arrow_forward, color: Colors.white,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1/1,
                children: [
                  // CustomTargetCard(
                  //   title: "Workout",
                  //   image: "assets/images/exer.png",
                  //   route: WorkoutScreen(),
                  //   context: context,
                  // ),
                  CustomTargetCard(
                    title: "Lose weight",
                    image: "assets/images/loss_weight.png",
                    route: LoseWeightScreen(),
                    context: context,
                  ),
                  CustomTargetCard(
                    title: "Steps",
                    image: "assets/images/walk.png",
                    route: StepsScreen(),
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
