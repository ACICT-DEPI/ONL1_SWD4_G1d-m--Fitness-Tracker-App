import 'package:final_project/features/nutrition/cubit/nutrition_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/nutrition_cubit.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key, required this.id});
  int id;

  String? _recipeName;

  List<String>? _ingredients;

  String? _instructions;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NutritionCubit, NutritionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NutritionCubit.get(context).getAllCategories(this.id);
        return Scaffold(
          appBar: AppBar(
            title: Text('Recipe Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_recipeName != null)
                  Text(
                    _recipeName!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(height: 16),
                if (_ingredients != null)
                  Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (_ingredients != null)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _ingredients!.length,
                    itemBuilder: (context, index) {
                      return Text('- ${_ingredients![index]}');
                    },
                  ),
                SizedBox(height: 16),
                if (_instructions != null)
                  Text(
                    'Instructions:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (_instructions != null) Text(_instructions!),
              ],
            ),
          ),
        );
      },
    );
  }
}
