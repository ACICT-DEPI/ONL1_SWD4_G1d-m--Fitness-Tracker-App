import 'package:final_project/core/utls/colors.dart';
import 'package:final_project/features/Home/presentation/views/wedgits/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopDesign extends StatelessWidget {
  const TopDesign({super.key});

  @override
  Widget build(BuildContext context) {
        var sizee = MediaQuery.of(context).size;
    return     Container(
            padding: EdgeInsets.all(sizee.width / 33),
            color: Colorsapp.darkOrange,
            child: Column(
              children: [
                customAppBar,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 260, // Adjust the width as needed
                      child: Text(
                        'Hesham Mohamed',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white, // Ensure the text color is black
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colorsapp.secondarycolor,
                              shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                                // color: Colorsapp.primarycolor,
                              )),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colorsapp.secondarycolor,
                              shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings,
                                  color: Colors.white,
                                // color: Colorsapp.primarycolor,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: double.infinity, // Adjust the width as needed
                  child: Text(
                    '22 male',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Ensure the text color is black
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}