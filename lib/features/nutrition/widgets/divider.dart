import 'package:flutter/material.dart';

class RecipeDivider extends StatelessWidget {
   RecipeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Divider(
        color: Colors.grey,
        height: .9,
        thickness: .5,
      ),
    );
  }
}
