import 'package:flutter/material.dart';

import '../../../../../core/utls/colors.dart';

class CustomWorkoutCard extends StatelessWidget {
  CustomWorkoutCard({super.key, required this.title, required this.image});

  String title;
  String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 2.8,
            height: MediaQuery.of(context).size.height / 7,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colorsapp.darkOrange,
              // gradient: LinearGradient(colors: [
              //   Colorsapp.darkOrange,
              //   Colorsapp.midOrange,
              //   Colorsapp.liteOrange,
              // ]),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image(image: AssetImage(image), width: 70,
                    //  color: Colors.white.withOpacity(.5),
                    ),
                  ],
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(title,
                        style: TextStyle(
                            fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
