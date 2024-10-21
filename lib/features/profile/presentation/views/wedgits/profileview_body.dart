import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/auth/cubit/auth_cubit.dart';
import 'package:final_project/features/auth/view/login_screen.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/profile_button.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/read_textfield.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/update_profile.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/user_picture.dart';
import 'package:final_project/features/workout/widgets/favorite_screen.dart';
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      FavoritesScreen())));
                        },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileButton(
                              pressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((BuildContext context) =>
                                            const UpdateProfile())));
                              },
                              title: "Edit Profile",
                              ic: const Icon(
                                Icons.edit_document,
                                color: Colors.white,
                              )),
                          ProfileButton(
                            pressed: () {
                              AuthCubit.get(context).signOut().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginScreen()));
                              });
                            },
                            title: "Log Out",
                            bgcolor: Colors.white,
                            textcolor: Colors.red,
                            ic: const Icon(
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
