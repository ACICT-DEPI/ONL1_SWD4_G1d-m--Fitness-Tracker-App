import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          appBar: AppBar(
            title: Text("Recipes"),
          ),
          body: cubit.recipes.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
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
        );
      },
    );
  }
}
