import 'package:final_project/features/lose_weight/cubit/lose_weight_cubit.dart';
import 'package:final_project/features/lose_weight/cubit/lose_weight_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryRecipesScreen extends StatelessWidget {
  CategoryRecipesScreen({super.key, required this.id});
  int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoseWeightCubit, LoseWeightStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LoseWeightCubit.get(context).getAllCategories(this.id);
        return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
      ),
      body: ListView.builder(
        itemCount: LoseWeightCubit.get(context).recipes.length,
        itemBuilder: (context, index) {
          final recipe = LoseWeightCubit.get(context).recipes[index];
          return Card(
            child: ListTile(
              leading: Image.network(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(recipe.recipe),
              subtitle: Text('Calories: ${recipe.calories} kcal\nServing: ${recipe.serving}'),
              trailing: Text(recipe.difficulty),
            ),
          );
        },
      ),
    );;
      },
    );
  }
}
