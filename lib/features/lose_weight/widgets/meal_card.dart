import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  MealCard({super.key,
    //required this.route,
    required this.title, required this.image});

  //Widget route;
  String title;
  String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => route,));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width * 1.5,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Image(image: AssetImage(image,), fit: BoxFit.fill,),
            ),
          ),
          Text(title, style: TextStyle(color: Colors.teal[300]),),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
