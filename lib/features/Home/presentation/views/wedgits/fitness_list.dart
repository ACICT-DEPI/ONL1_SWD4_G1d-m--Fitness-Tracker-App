import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/specific_workout.dart';
import 'package:flutter/material.dart';

class FitnessList extends StatelessWidget {
  const FitnessList({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 25,
        itemBuilder: (BuildContext context, index) {
          return Card(
            color: Colorsapp.darkOrange,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(33),
            ),
            child: Container(
              width: 300,
              height: 150,
              padding: EdgeInsets.all(sizee.width / 26),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 1.8 / 1.8,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/wout.jpg"),
                              fit: BoxFit.fill),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WORKOUT\n AT HOME',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'PUSH',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: sizee.width / 8,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SpecificWorkout()));
                      },
                      icon: const Icon(Icons.arrow_forward))
                ],
              ),
            ),
          );
        });
  }
}
