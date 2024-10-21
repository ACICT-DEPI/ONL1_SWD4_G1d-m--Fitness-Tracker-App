import 'package:final_project/features/Auth/cubit/auth_cubit.dart';
import 'package:final_project/features/Auth/cubit/auth_states.dart';
import 'package:final_project/features/profile/wedgits/profile_button.dart';
import 'package:final_project/features/profile/wedgits/read_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/colors.dart';
import '../wedgits/user_picture.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
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
                      height: size.height / 1.25,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width / 65),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            ReadTextfield(
                              fieldcontent: cubit.name ?? '',
                              hint: "Name",
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            ReadTextfield(
                              hint: "Email",
                              fieldcontent: cubit.email ?? '',
                            ),
                            // SizedBox(height: size.height/30,),
                            Divider(
                              indent: 15,
                              thickness: 2,
                              endIndent: 15,
                              height: size.height / 13,
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
                                    width: size.width / 1.8,
                                  ),
                                  const Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height / 30,
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
                                    width: size.width / 1.6,
                                  ),
                                  const Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height / 10,
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
          ),
        );
      },
    );
  }
}
