import 'package:flutter/material.dart';

import '../../../../../core/utls/colors.dart';

class CustomTargetCard extends StatelessWidget {
  CustomTargetCard({super.key, required this.title, required this.image});

  String title;
  String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 7,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colorsapp.darkOrange,
                Colorsapp.midOrange,
                Colorsapp.liteOrange,
              ]),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(title,
                        style: TextStyle(
                            fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                    SizedBox(width: 0,),
                    Icon(Icons.arrow_forward_ios, size: 40,
                      color: Colorsapp.darkGrey,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: Image(image: AssetImage(image), width: 130,
                    color: Colors.white.withOpacity(.5),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
