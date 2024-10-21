import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/profile_button.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/read_textfield.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/user_picture.dart';
import 'package:flutter/material.dart';

class ProfileviewBody extends StatelessWidget {
  const ProfileviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var sizee = MediaQuery.of(context).size;

    return Stack(
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
                        fieldcontent: "Sophia Patel",
                        hint: "Name",
                      ),
                      SizedBox(
                        height: sizee.height / 30,
                      ),
                      const ReadTextfield(
                        hint: "Email",
                        fieldcontent: "heshamffgg@gmail.com",
                      ),
                      // SizedBox(height: sizee.height/30,),
                      Divider(
                        indent: 15,
                        thickness: 2,
                        endIndent: 15,
                        height: sizee.height / 13,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Notification",
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              width: sizee.width / 1.8,
                            ),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizee.height / 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Favorites",
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              width: sizee.width / 1.6,
                            ),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: sizee.height / 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileButton(
                              title: "Edit Profile",
                              ic: Icon(
                                Icons.edit_document,
                                color: Colors.white,
                              )),
                          ProfileButton(
                            title: "Log Out",
                            bgcolor: Colors.white,
                            textcolor: Colors.red,
                            ic: Icon(
                              Icons.logout_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const UserPicture(),
          ],
        ),
      ],
    );
  }
}
