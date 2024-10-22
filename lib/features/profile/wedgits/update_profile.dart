import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/read_textfield.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/user_picture.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colorsapp.darkOrange,
      body: Stack(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: sizee.height / 1.25,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizee.width / 65),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const ReadTextfield(
                          fieldcontent: "",
                          hint: "Name",
                        ),
                        SizedBox(
                          height: sizee.height / 30,
                        ),
                        const ReadTextfield(
                          hint: "Email",
                          fieldcontent: "heshamffgg@gmail.com",
                        ),
                        SizedBox(
                          height: sizee.height / 30,
                        ),
                        const ReadTextfield(
                          hint: "Password",
                          fieldcontent: "heshamffgg@gmail.com",
                        ),
                        // SizedBox(height: sizee.height/30,),
                      ],
                    ),
                  ),
                ),
              ),
              const Column(
                children: [
                  Stack(
                    children: [
                      UserPicture(),
                      Align(
                          heightFactor: 12,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Change Picture",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
