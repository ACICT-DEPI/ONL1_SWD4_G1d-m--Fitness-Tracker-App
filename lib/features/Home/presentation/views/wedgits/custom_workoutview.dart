import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_appbar.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/fitness_list.dart';
import 'package:flutter/material.dart';

class CustomWorkoutview extends StatelessWidget {
  const CustomWorkoutview({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(sizee.width / 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customAppBar,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const SizedBox(
          width: 260, // Adjust the width as needed
          child: Text( 'Hesham Mohamed',
              style: TextStyle(
                
                fontSize: 30,
                color: Colors.black, // Ensure the text color is black
              ),),
          ),
      
    
                 Row(
                  children: [
                    Container(
                      decoration:  BoxDecoration(
                          color: Colorsapp.secondarycolor, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {}, icon:  Icon(Icons.person,color: Colorsapp.primarycolor,)),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      decoration:  BoxDecoration(
                          color: Colorsapp.secondarycolor, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {}, icon:  Icon(Icons.settings,color: Colorsapp.primarycolor,)),
                    )
                  ],
                ),
              ],
            ),
                const SizedBox(
          width: double.infinity, // Adjust the width as needed
          child: Text( '22 male',
              style: TextStyle(
                
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Ensure the text color is black
              ),),
          ),
            const FitnessList(),
          ],
        ),
      ),
    );
  }
}
