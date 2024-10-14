import 'package:flutter/material.dart';

class CalcCard extends StatelessWidget {
  CalcCard({super.key, required this.route, required this.image, required this.title});

  Widget route;
  String image;
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
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 1.5,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Image(image: AssetImage(image), fit: BoxFit.fill,),
          ),
          SizedBox(height: 5,),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[300]),),

        ],
      ),
    );
  }
}
