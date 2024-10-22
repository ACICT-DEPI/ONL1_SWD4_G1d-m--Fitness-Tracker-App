import 'package:final_project/features/Auth/view/home_check.dart';
import 'package:flutter/material.dart';

class CustomTargetCard extends StatelessWidget {
  CustomTargetCard({
    super.key,
    required this.title,
    required this.des,
    required this.image,
    required this.route,
    required this.context,
  });

  String title;
  String des;
  String image;
  Widget route;
  var context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeCheck(route: route),
              ));
        },
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(colors: [
                  //   Colorsapp.darkOrange,
                  //   Colorsapp.midOrange,
                  //   Colorsapp.liteOrange,
                  // ]),
                  color: Colors.grey[900],
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
                              color: Colors.deepOrange[400],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 40.0),
                          child: Image(
                            image: AssetImage(image),
                            width: 70,
                            height: 80,
                            //color: Colors.white.withOpacity(.5),
                          ),
                        ),
                        Text(
                          des,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              ),
                        ),
                      ]),
                ))));
  }
}
