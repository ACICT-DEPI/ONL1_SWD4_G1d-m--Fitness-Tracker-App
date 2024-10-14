import 'package:final_project/features/lose_weight/cubit/lose_weight_cubit.dart';
import 'package:final_project/features/lose_weight/cubit/lose_weight_states.dart';
import 'package:final_project/features/lose_weight/views/recipe_screen.dart';
import 'package:final_project/features/lose_weight/widgets/calc_list.dart';
import 'package:final_project/features/lose_weight/widgets/meal_card.dart';
import 'package:final_project/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/calc_card.dart';

class LoseWeightScreen extends StatelessWidget {
  const LoseWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoseWeightCubit.get(context);
    return BlocConsumer<LoseWeightCubit, LoseWeightStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Lose weight',
              style: TextStyle(color: Colors.white),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                )),
          ),
          body:
          cubit.categories.isEmpty?
          Center(child: CircularProgressIndicator()):
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image(image: AssetImage("assets/images/weights.jpg")),
                //Text("Follow the steps to lose weight using healthy ways", style: TextStyle(color: Colors.teal[100], fontSize: 18),),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Text(
                    "Fitness and Health Calculators",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.separated(
                    itemCount: calc.length,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CalcCard(
                      title: calc[index].title,
                      image: calc[index].image,
                      route: calc[index].route,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: Text(
                    "Healthy Meals",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ListView.builder(
                    //scrollDirection: Axis.horizontal,
                    itemCount: cubit.categories.length,
                    itemBuilder: (context, index) =>
                        MealCard(
                          title: cubit.categories[index].category.toString(),
                          image: cubit.categories[index].thumbnail.toString(),
                          id: cubit.categories[index].id,
                        ),
                    ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
