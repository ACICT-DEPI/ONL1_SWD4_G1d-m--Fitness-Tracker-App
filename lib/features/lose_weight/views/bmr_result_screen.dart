import 'package:final_project/features/lose_weight/cubit/lose_weight_cubit.dart';
import 'package:final_project/features/lose_weight/cubit/lose_weight_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/constant_var.dart';
import '../widgets/calculate_button.dart';
import '../widgets/reusable_card.dart';

class BmrResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoseWeightCubit, LoseWeightStates>(
        listener: (context, state) {},
      builder: (context, state) => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('BMR CALCULATOR', style: TextStyle(color: Colors.white),),
         leading: InkWell(onTap: (){Navigator.pop(context);},
             child: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white,)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("calories/day",
                    //LoseWeightCubit.get(context).getResult(),
                    style: kResultsTextStyle,
                  ),
                  Text(
                    LoseWeightCubit.get(context).calculateBMR().toString(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    "This is the number of calories your body needs to maintain basic physiological functions while at rest.",
                    textAlign: TextAlign.center,
                    style: kResultsBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ),
    );
  }
}