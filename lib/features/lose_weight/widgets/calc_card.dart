import 'package:flutter/material.dart';

import '../../../core/utls/colors.dart';

class CalcCard extends StatelessWidget {
  CalcCard({super.key, required this.route, required this.title});

  Widget route;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.green[100]!,
            Colors.green[200]!,
            Colors.green[300]!,
          ]),
          //color: Colors.teal[200],//Colorsapp.darkOrange,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(
            child: Text(title,
              style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
