import 'package:final_project/features/Auth/view/home_check.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';

class CustomTargetCard extends StatelessWidget {
  CustomTargetCard({
    super.key, required this.title,
    required this.image, required this.route,
    required this.context,
  });

  String title;
  String image;
  Widget route;
  var context;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeCheck(route: route),));
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colorsapp.darkOrange,
              Colorsapp.midOrange,
              Colorsapp.liteOrange,
            ]),
            //color: Colorsapp.liteOrange,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
                  child: Image(
                    image: AssetImage(image),
                    width: 70,
                    height: 90,
                    //color: Colors.white.withOpacity(.5),
                  ),
                ),
                // Row(
                //   children: [
                //     Text(
                //       "500",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     Text(
                //       " Cal",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 14,),
                //     ),
                //   ],
                // ),
                // Text(
                //   "last update 5m",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 14,),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
