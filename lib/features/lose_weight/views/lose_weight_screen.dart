import 'package:final_project/features/lose_weight/widgets/calc_list.dart';
import 'package:final_project/features/lose_weight/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/calc_card.dart';

class LoseWeightScreen extends StatelessWidget {
  const LoseWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Lose weight', style: TextStyle(color: Colors.white),),
         leading: InkWell(onTap: (){Navigator.pop(context);},
             child: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/images/weights.jpg")),
            //Text("Follow the steps to lose weight using healthy ways", style: TextStyle(color: Colors.teal[100], fontSize: 18),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              child: Text("Fitness and Health Calculators", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
              child: ListView.separated(
                itemCount: calc.length,
                 separatorBuilder: (context, index) => SizedBox(width: 10,),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CalcCard(
                      title: calc[index].title,
                      route: calc[index].route,),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              child: Text("Healthy Meals", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Column(
              children: [
                MealCard(title: "Breakfast", image: "assets/images/breakfast.webp"),
                MealCard(title: "Lunch", image: "assets/images/lunch.jpg"),
                MealCard(title: "Dinner", image: "assets/images/dinner.jpg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
