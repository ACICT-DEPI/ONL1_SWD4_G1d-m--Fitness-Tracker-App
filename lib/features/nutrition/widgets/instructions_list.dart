import 'package:final_project/model/category.dart';
import 'package:flutter/material.dart';

class InstructionsList extends StatelessWidget {
  InstructionsList({super.key, required this.recipe});

  Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(recipe.directionsStep1 != null) Text(
            '- ${recipe.directionsStep1}',
            style: TextStyle(color: Colors.white),
          ),
        if(recipe.directionsStep2 != null) Text(
          '- ${recipe.directionsStep2}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep3 != null) Text(
          '- ${recipe.directionsStep3}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep4 != null) Text(
          '- ${recipe.directionsStep4}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep5 != null) Text(
          '- ${recipe.directionsStep5}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep6 != null) Text(
          '- ${recipe.directionsStep6}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep7 != null) Text(
          '- ${recipe.directionsStep7}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep8 != null) Text(
          '- ${recipe.directionsStep8}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep9 != null) Text(
          '- ${recipe.directionsStep9}',
          style: TextStyle(color: Colors.white),
        ),
        if(recipe.directionsStep10 != null) Text(
          '- ${recipe.directionsStep10}',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
