import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/body_calc/cubit/body_calc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubit/body_calc_cubit.dart';
import '../widgets/calc_card.dart';
import '../widgets/calc_list.dart';

class BodyCalcScreen extends StatelessWidget {
  const BodyCalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BodyCalcCubit.get(context);
    return BlocConsumer<BodyCalcCubit, BodyCalcStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Body Calculators',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalcCard(
                      title: calc[0].title,
                      image: calc[0].image,
                      route: calc[0].route,
                    ),
                CalcCard(
                      title: calc[1].title,
                      image: calc[1].image,
                      route: calc[1].route,
                    ),
                CalcCard(
                      title: calc[2].title,
                      image: calc[2].image,
                      route: calc[2].route,
                    ),
                CalcCard(
                      title: calc[3].title,
                      image: calc[3].image,
                      route: calc[3].route,
                    ),
                SizedBox(height: 70,),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 1,
                //   child: ListView.separated(
                //     itemCount: calc.length,
                //     separatorBuilder: (context, index) => SizedBox(
                //       height: 30,
                //     ),
                //     itemBuilder: (context, index) =>
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
