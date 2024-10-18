import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubit/nutrition_cubit.dart';
import '../cubit/nutrition_states.dart';

class CategoryRecipesScreen extends StatelessWidget {
  CategoryRecipesScreen({super.key, required this.id});
  int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NutritionCubit, NutritionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NutritionCubit.get(context);
        cubit.getAllCategories(this.id);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              cubit.recipes[id].category.category,
              style: const TextStyle(color: Colors.white),
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
          body: cubit.recipes.isEmpty
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: ListView.builder(
                    itemCount: cubit.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = cubit.recipes[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(recipe.image,
                              width: 50, height: 50, fit: BoxFit.cover),
                          title: Text(recipe.recipe),
                          subtitle: Text(
                              'Calories: ${recipe.calories} kcal\nServing: ${recipe.serving}'),
                          trailing: Text(recipe.difficulty??""),
                        ),
                      );
                    },
                  ),
              ),
        );
      },
    );
  }
}
