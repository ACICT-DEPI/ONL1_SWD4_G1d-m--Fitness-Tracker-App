import 'package:final_project/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:final_project/features/nutrition/cubit/nutrition_states.dart';
import 'package:final_project/features/nutrition/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = NutritionCubit.get(context);
    //cubit.getCategories();
    return BlocConsumer<NutritionCubit, NutritionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Nutrition',
              style: TextStyle(color: Colors.white),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                )),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image(image: AssetImage("assets/images/weights.jpg")),
                //Text("Follow the steps to lose weight using healthy ways", style: TextStyle(color: Colors.teal[100], fontSize: 18),),
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
                //cubit.categories.isEmpty
                    //? Center(child: CircularProgressIndicator()):
                     SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ListView.builder(
                          //scrollDirection: Axis.horizontal,
                          itemCount: cubit.categories.length,
                          itemBuilder: (context, index) => MealCard(
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
