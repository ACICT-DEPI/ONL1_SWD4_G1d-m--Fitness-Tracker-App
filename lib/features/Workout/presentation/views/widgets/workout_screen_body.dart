import 'package:final_project/features/Workout/presentation/views/widgets/top_design.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/colors.dart';
import 'custom_workoutview.dart';

class WorkoutScreenBody extends StatefulWidget {
  const WorkoutScreenBody({super.key});

  @override
  State<WorkoutScreenBody> createState() => _WorkoutScreenBodyState();
}

class _WorkoutScreenBodyState extends State<WorkoutScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        //Colorsapp.secondarycolor,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Workout',
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
        body: const SingleChildScrollView(
          child: Column(
            children: [
              //TopDesign(),
              CustomWorkoutview()
            ],
          ),
        ));
  }
}
