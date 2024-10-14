import 'package:final_project/features/lose_weight/views/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'custom_meal_button.dart';

class MealCard extends StatelessWidget {
  MealCard(
      {super.key,
      required this.id,
      required this.title,
      required this.image});

  int id;
  String title;
  String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 1.1,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            title,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal[300]),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomMealButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeScreen(id: id),));}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
