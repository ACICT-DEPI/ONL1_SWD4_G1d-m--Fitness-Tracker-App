import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/profile/presentation/views/wedgits/profileview_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsapp.darkOrange,
      body:const ProfileviewBody() ,
    );
  }
}