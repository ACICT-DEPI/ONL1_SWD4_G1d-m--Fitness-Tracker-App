import 'package:final_project/features/Home/presentation/views/wedgits/fitness_list.dart';
import 'package:flutter/material.dart';

class Customscrollview extends StatelessWidget {
  const Customscrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: FitnessList(),
        )
      ],
    );
  }
}